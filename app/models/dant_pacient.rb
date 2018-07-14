# == Schema Information
#
# Table name: dant_pacients
#
#  id              :integer          not null, primary key
#  nome            :string
#  sexo            :integer
#  endereco        :string
#  rg              :string
#  cpf             :string
#  idade           :integer
#  frascos_diarios :string
#  frascos_mensais :string
#  tipo_insulina   :string
#  hipertenso      :boolean
#  diabetico       :boolean
#  tabagista       :boolean
#  etilista        :boolean
#  obeso           :boolean
#  grau_obesidade  :integer
#  cidade_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_dant_pacients_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class DantPacient < ApplicationRecord
  belongs_to :cidade
end
