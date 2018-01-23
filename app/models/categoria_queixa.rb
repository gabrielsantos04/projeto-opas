# == Schema Information
#
# Table name: categoria_queixas
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CategoriaQueixa < ApplicationRecord
  has_many :queixas

  def to_s
    self.nome
  end
end
