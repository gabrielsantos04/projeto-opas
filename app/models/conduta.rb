# == Schema Information
#
# Table name: condutas
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conduta < ApplicationRecord
  self.table_name = "condutas"
  has_many :conduta_recidivas

  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end
end
