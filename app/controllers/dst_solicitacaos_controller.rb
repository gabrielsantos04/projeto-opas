#Classe que controla as açoes da DstSolicitacao
class DstSolicitacaosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_dst_solicitacao, only: [:show, :edit, :update, :destroy,:autorizar,:recusar]
  before_action :set_combos, only: [:new, :edit, :create, :update]

  # GET /dst_solicitacaos
  def index
    if current_user.admin_dst? || current_user.administrador?
      @q = DstSolicitacao.all.order(created_at: :desc).ransack(params[:q])
    elsif current_user.dst_produtos?
      @q = DstSolicitacao.where(status: :autorizado).order(created_at: :desc).ransack(params[:q])
    else
      @q = current_user.dst_solicitacaos.order(created_at: :desc).ransack(params[:q])
    end
    @dst_solicitacaos = @q.result.page(params[:page])
  end

  # GET /dst_solicitacaos/1
  def show
  end

  #Método que renderiza o mapa de controle de distribuição
  def mapa
    @q = Cidade.includes(:dst_solicitacaos).where(status: true).ransack(params[:q])
    @cidades = @q.result
  end

  # GET /dst_solicitacaos/new
  def new
    @dst_solicitacao = DstSolicitacao.new
    @dst_solicitacao.cidade = current_user.cidade
    @dst_solicitacao.ano = Date.today.year
    DstQuestionario.where(ativo: true).map do |q|
      @dst_solicitacao.dst_resposta.build(dst_questionario: q)
    end
    DstProduto.all.map do |p|
      solicitacao_anterior = DstSolicitacaoProduto.includes(:cidade).where(cidades: {id: current_user.cidade}).where(dst_produto_id: p.id).last
      if solicitacao_anterior.present?
        @dst_solicitacao.dst_solicitacao_produtos.build(dst_produto_id: p.id, quantidade: 0, distribuido: 0, saldo_anterior: solicitacao_anterior.saldo_final, entradas_ms: 0,qtd_remanejado: 0,qtd_perdas: 0)
      else
        @dst_solicitacao.dst_solicitacao_produtos.build(dst_produto_id: p.id, quantidade: 0, distribuido: 0, saldo_anterior: 0, entradas_ms: 0,qtd_remanejado: 0,qtd_perdas: 0)
      end

    end
  end

  # GET /dst_solicitacaos/1/edit
  def edit
    if current_user.dst_produtos?
      redirect_to @dst_solicitacao, alert: "Você não tem permissão para editar a Solicitação!"
    end
    if @dst_solicitacao.entregue? || @dst_solicitacao.recusado?
      redirect_to @dst_solicitacao, alert: "Não é possível editar a solicitação após ser Recusada ou Entregue!"
    end
  end

  def autorizar
    @dst_solicitacao.status = :autorizado
    @dst_solicitacao.save
    redirect_to @dst_solicitacao
  end

  def entregar
    unless possui_quantidade_atendida?
      redirect_to @dst_solicitacao, alert: "Informe as quantidades atendidas!"
    else
      @dst_solicitacao.status = :entregue
      @dst_solicitacao.save
      redirect_to @dst_solicitacao
    end
  end

  def recusar
    @dst_solicitacao.status = :recusado
    @dst_solicitacao.save
    @dst_solicitacao.dst_solicitacao_produtos.update_all(quantidade_aprovada: 0, status: :recusado, quantidade_atendido: 0)
    redirect_to @dst_solicitacao
  end

  # POST /dst_solicitacaos
  def create
    @dst_solicitacao = DstSolicitacao.new(dst_solicitacao_params)
    @dst_solicitacao.user = current_user
    @dst_solicitacao.status = :solicitado

    if @dst_solicitacao.save
      redirect_to @dst_solicitacao, notice: 'Solicitação cadastrada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_solicitacaos/1
  def update
    if @dst_solicitacao.update(dst_solicitacao_params)
      redirect_to @dst_solicitacao, notice: 'Solicitação atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /dst_solicitacaos/1
  def destroy
    @dst_solicitacao.destroy
    redirect_to dst_solicitacaos_url, notice: 'Solicitacao excluída com sucesso.'
  end

  private
    def possui_quantidade_atendida?
      @dst_solicitacao.dst_solicitacao_produtos.each do |p|
        return if p.quantidade_atendido == nil
      end

      true
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_solicitacao
      @dst_solicitacao = DstSolicitacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_solicitacao_params
      params.require(:dst_solicitacao).permit(
          :dst_local_id, :observacoes, :user_id, :status,:responsavel,:cargo_funcao,:contato,:cidade_id,:mes, :ano,
          dst_solicitacao_produtos_attributes:[
              :id, :dst_produto_id,:saldo_anterior,:entradas_ms,:qtd_remanejado,:qtd_perdas,:saldo_final, :quantidade, :distribuido, :_destroy
          ],
          dst_resposta_attributes:[
              :id, :dst_questionario_id, :valor
          ]
      )
    end

    #Método utilizado para setar os locais utilizados no formulário
    def set_combos
      @locals = current_user.dst_locals.map{|a| [a.nome, a.id]}
    end
end
