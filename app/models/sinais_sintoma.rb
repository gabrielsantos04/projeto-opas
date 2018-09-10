# == Schema Information
#
# Table name: sinais_sintomas
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SinaisSintoma < ApplicationRecord
  has_many :sintomas_recidivas

  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
