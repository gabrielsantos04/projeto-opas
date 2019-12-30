# == Schema Information
#
# Table name: imunizacao_indications
#
#  id         :integer          not null, primary key
#  descricao  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImunizacaoIndication < ApplicationRecord
  has_many :imunizacao_vacina_indications
  has_many :imunizacao_vacinas, through: :imunizacao_vacina_indications

  accepts_nested_attributes_for :imunizacao_vacina_indications, allow_destroy: true

  def to_s
    self.descricao
  end

  #Método que retorna um array para ser utilizado nos combos
  def self.to_select
    all.order(:descricao).map{|a| ["#{a}", a.id]}
  end
end
