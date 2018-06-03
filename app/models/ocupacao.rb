# == Schema Information
#
# Table name: ocupacaos
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  codigo     :string
#

class Ocupacao < ApplicationRecord
  has_many :pacientes

  def to_s
    self.nome
  end
end
