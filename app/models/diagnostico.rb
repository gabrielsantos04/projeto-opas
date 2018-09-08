# == Schema Information
#
# Table name: diagnosticos
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Diagnostico < ApplicationRecord
  has_many :diagnostico_recidivas
  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
