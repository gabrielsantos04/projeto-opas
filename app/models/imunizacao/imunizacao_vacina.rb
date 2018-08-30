# == Schema Information
#
# Table name: imunizacao_vacinas
#
#  id         :integer          not null, primary key
#  nome       :string
#  descricao  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImunizacaoVacina < ApplicationRecord
  def to_s
    self.nome
  end

  def self.to_select
    all.map{|a| ["#{a}", a.id]}
  end

end
