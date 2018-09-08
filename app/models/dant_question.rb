# == Schema Information
#
# Table name: dant_questions
#
#  id         :integer          not null, primary key
#  pergunta   :integer
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DantQuestion < ApplicationRecord
  #Método que retorna o nome do objeto
  def to_s
    self.texto
  end
end
