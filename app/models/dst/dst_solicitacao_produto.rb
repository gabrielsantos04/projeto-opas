# == Schema Information
#
# Table name: dst_solicitacao_produtos
#
#  id                  :integer          not null, primary key
#  dst_produto_id      :integer
#  quantidade          :decimal(, )
#  status              :string
#  dst_solicitacao_id  :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distribuido         :decimal(, )
#  observacoes         :text
#  quantidade_aprovada :decimal(, )
#  user_id             :integer
#
# Indexes
#
#  index_dst_solicitacao_produtos_on_dst_produto_id      (dst_produto_id)
#  index_dst_solicitacao_produtos_on_dst_solicitacao_id  (dst_solicitacao_id)
#  index_dst_solicitacao_produtos_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_produto_id => dst_produtos.id)
#  fk_rails_...  (dst_solicitacao_id => dst_solicitacaos.id)
#  fk_rails_...  (user_id => users.id)
#

class DstSolicitacaoProduto < ApplicationRecord
  belongs_to :dst_produto
  belongs_to :dst_solicitacao
  belongs_to :user
  has_many :dst_movimentacaos

  extend Enumerize

  enumerize :status, in: [:solicitado, :autorizado, :recusado, :atendido, :atendido_parcialmente], default: :solicitado,  predicates: true

  def to_s
    "Solicitação de Produto Nº#{self.id}"
  end

  def quantidade_atendido
    dst_movimentacaos.where(tipo: 'entrada').sum(:quantidade)
  end

  def max_atender
   self.quantidade_aprovada -  quantidade_atendido
  end
end
