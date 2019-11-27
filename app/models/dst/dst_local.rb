# == Schema Information
#
# Table name: dst_locals
#
#  id         :integer          not null, primary key
#  nome       :string
#  descricao  :text
#  cidade_id  :integer
#  categoria  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dst_locals_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class DstLocal < ApplicationRecord
  belongs_to :cidade, dependent: :nullify
  has_many :dst_user_locals
  has_many :dst_movimentacaos
  has_many :dst_solicitacaos


  extend Enumerize

  enumerize :categoria, in: [:interno, :externo], predicates: true
  accepts_nested_attributes_for :dst_user_locals, allow_destroy: true

  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
