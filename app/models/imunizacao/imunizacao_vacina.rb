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
  has_many :imunizacao_indications

  accepts_nested_attributes_for :imunizacao_indications, allow_destroy: true


  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end

  #Método que retorna um array para ser utilizado nos combos
  def self.to_select
    all.order(:nome).map{|a| ["#{a}", a.id]}
  end

end
