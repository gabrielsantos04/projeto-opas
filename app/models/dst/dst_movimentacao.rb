# == Schema Information
#
# Table name: dst_movimentacaos
#
#  id                         :integer          not null, primary key
#  dst_produto_id             :integer
#  tipo                       :string
#  categoria                  :string
#  quantidade                 :decimal(, )
#  dst_lote_id                :integer
#  descricao                  :text
#  dst_local_id               :integer
#  dst_solicitacao_produto_id :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_dst_movimentacaos_on_dst_local_id                (dst_local_id)
#  index_dst_movimentacaos_on_dst_lote_id                 (dst_lote_id)
#  index_dst_movimentacaos_on_dst_produto_id              (dst_produto_id)
#  index_dst_movimentacaos_on_dst_solicitacao_produto_id  (dst_solicitacao_produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (dst_lote_id => dst_lotes.id)
#  fk_rails_...  (dst_produto_id => dst_produtos.id)
#  fk_rails_...  (dst_solicitacao_produto_id => dst_solicitacao_produtos.id)
#

class DstMovimentacao < ApplicationRecord
  belongs_to :dst_produto
  belongs_to :dst_lote
  belongs_to :dst_local
  belongs_to :dst_solicitacao_produto, optional: true

  extend Enumerize

  enumerize :tipo, in: [:entrada, :saida], predicates: true
  enumerize :categoria, in: [
      :estoque_inicial, :distribuicao_municipio, :distribuicao_usuario, :acerto,
      :remanejamento, :perda, :vencimento, :entrada_em_estoque
  ], predicates: true

  validate :check_balance
  before_validation :check_value

  def to_s
    "Movimentação Nº#{self.id}"
  end

  def check_value
    if entrada? and self.quantidade < 0
      self.quantidade = self.quantidade * -1
    end

    if saida? and self.quantidade > 0
      self.quantidade = self.quantidade * -1
    end
  end

  def check_balance
    if saida?
      balance = DstMovimentacao
                    .where(dst_local: self.dst_local, dst_produto_id: self.dst_produto_id, dst_lote_id: self.dst_lote_id)
                    .sum(:quantidade)
      if (balance + self.quantidade) < 0
        errors.add(:quantidade, 'de saída é maior que a entrada de produtos nesse lote')
      end
    end
  end

  def self.atender(params)
    solicitacao_produto = DstSolicitacaoProduto.find(params[:solicitacao_produto_id])
    solicitacao = solicitacao_produto.dst_solicitacao
    if params[:quantidade].to_f > solicitacao_produto.max_atender
      return "swal('O valor máximo aprovado é de #{solicitacao_produto.max_atender}')"
    end
      saida = DstMovimentacao.new(
        dst_produto: solicitacao_produto.dst_produto,
        tipo: :saida,
        categoria: :distribuicao_municipio,
        quantidade: params[:quantidade],
        dst_lote_id: params[:lote],
        dst_solicitacao_produto: solicitacao_produto,
        dst_local_id: params[:origem]
      )

      entrada = DstMovimentacao.new(
          dst_produto: solicitacao_produto.dst_produto,
          tipo: :entrada,
          categoria: :distribuicao_municipio,
          quantidade: params[:quantidade],
          dst_lote_id: params[:lote],
          dst_solicitacao_produto: solicitacao_produto,
          dst_local_id: params[:origem]
      )

      if !saida.save or !entrada.save
        saida.delete
        entrada.delete

        return "swal('Saída: #{saida.errors.full_messages.to_sentence} Entrada: #{entrada.errors.full_messages.to_sentence}')"
      end
    "window.location = '/dst/dst_movimentacaos/atender?sucesso=true'"
  end
end
