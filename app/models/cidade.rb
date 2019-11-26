# == Schema Information
#
# Table name: cidades
#
#  id              :integer          not null, primary key
#  nome            :string
#  uf              :string
#  latitude        :string
#  longitude       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  pacientes_count :integer          default(0)
#  status          :boolean
#

class Cidade < ApplicationRecord
  has_many :pacientes
  has_many :users
  has_many :dant_cidade_regions
  has_one :dant_region, through: :dant_cidade_regions
  has_many :dst_solicitacaos

  default_scope -> {order(nome: :asc)}

  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end

  #Método que retorna um array para o combo
  def self.to_select
    all.map{|a| ["#{a}", a.id]}
  end

  ransacker :ano do
    Arel.sql('extract(year from created_at)')
  end
end
