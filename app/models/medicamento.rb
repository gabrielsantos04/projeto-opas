# == Schema Information
#
# Table name: medicamentos
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medicamento < ApplicationRecord
  has_many :esquema_substitutivos
  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
