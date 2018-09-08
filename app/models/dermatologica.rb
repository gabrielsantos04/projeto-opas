# == Schema Information
#
# Table name: dermatologicas
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dermatologica < ApplicationRecord
  has_many :dermatologico_recidivas
  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
