# == Schema Information
#
# Table name: dst_lotes
#
#  id             :integer          not null, primary key
#  dst_produto_id :integer
#  nome           :string
#  descricao      :text
#  validade       :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_dst_lotes_on_dst_produto_id  (dst_produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_produto_id => dst_produtos.id)
#

class DstLote < ApplicationRecord
  belongs_to :dst_produto
  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
