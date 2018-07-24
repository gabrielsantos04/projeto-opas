# == Schema Information
#
# Table name: dst_produtos
#
#  id             :integer          not null, primary key
#  nome           :string
#  descricao      :text
#  unidade_medida :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DstProduto < ApplicationRecord
  has_many :dst_lotes
  has_many :dst_movimentacaos
  def to_s
    self.nome
  end
end
