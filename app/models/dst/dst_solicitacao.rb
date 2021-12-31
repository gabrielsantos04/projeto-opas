# == Schema Information
#
# Table name: dst_solicitacaos
#
#  id           :integer          not null, primary key
#  dst_local_id :integer
#  observacoes  :text
#  user_id      :integer
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  token        :string
#  responsavel  :string
#  cargo_funcao :string
#  contato      :string
#  cidade_id    :integer
#  mes          :string
#
# Indexes
#
#  index_dst_solicitacaos_on_cidade_id     (cidade_id)
#  index_dst_solicitacaos_on_dst_local_id  (dst_local_id)
#  index_dst_solicitacaos_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (user_id => users.id)
#

class DstSolicitacao < ApplicationRecord
  require 'uniquify'
  belongs_to :dst_local, optional: true
  belongs_to :user, optional: true
  has_many :dst_solicitacao_produtos
  has_many :dst_resposta
  belongs_to :cidade, optional: true, dependent: :destroy

  accepts_nested_attributes_for :dst_resposta, allow_destroy: true
  accepts_nested_attributes_for :dst_solicitacao_produtos, allow_destroy: true
  uniquify :token, length: 7, chars: 0..9

  extend Enumerize

  enumerize :status, in: [:solicitado, :autorizado, :recusado, :entregue], default: :solicitado,  predicates: true

  after_save :realizar_movimentacao

  #Método que realiza as movimentações no estoque após a conclusão da solicitação
  def realizar_movimentacao
    if self.status == :entregue
      estoque = DstLocal.last
      if estoque.present?
      self.dst_solicitacao_produtos.each do |p|
        if p.status == :autorizado
          movimentacao = DstMovimentacao.find_or_initialize_by(dst_solicitacao_produto_id: p.id)
          movimentacao.dst_produto_id = p.dst_produto_id
          movimentacao.tipo = :saida
          movimentacao.categoria = :distribuicao_municipio
          movimentacao.quantidade = p.quantidade_atendido
          movimentacao.descricao = "Realizado automaticamente pelo sistema"
          movimentacao.dst_local_id = estoque.id
          movimentacao.save
        end
      end
      end
    elsif self.status == :recusado
      self.dst_solicitacao_produtos.each do |p|
        DstMovimentacao.where(dst_solicitacao_produto_id: p.id).destroy_all
      end
    end

  end

  #Método que retorna o nome do objeto
  def to_s
    "Solicitação Nº#{self.id}"
  end

  ransacker :ano do
    Arel.sql('extract(year from dst_solicitacaos.created_at)')
  end

end
