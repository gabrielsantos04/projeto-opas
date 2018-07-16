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
#  frascos_diarios :integer
#  frascos_mensais :integer
#  obito           :boolean
#  data_obito      :date
#
# Indexes
#
#  index_dant_pacients_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'test_helper'

class DantPacientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
