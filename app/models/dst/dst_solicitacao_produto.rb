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
  belongs_to :dst_produto, optional: true
  belongs_to :dst_solicitacao, optional: true
  belongs_to :user, optional: true
  has_many :dst_movimentacaos

  extend Enumerize

  enumerize :status, in: [:solicitado, :autorizado, :recusado, :atendido, :atendido_parcialmente], default: :solicitado,  predicates: true

  #Método que retorna o nome do objeto
  def to_s
    "Solicitação de Produto Nº#{self.id}"
  end

  #Método que retorna a quantidade atendida
  def quantidade_atendido
    dst_movimentacaos.where(tipo: 'entrada').sum(:quantidade)
  end

  #Método que retorna a quantidade máxima permitida
  def max_atender
   self.quantidade_aprovada -  quantidade_atendido
  end
end
