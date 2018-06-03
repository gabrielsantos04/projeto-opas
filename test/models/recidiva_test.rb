# == Schema Information
#
# Table name: recidivas
#
#  id                                 :integer          not null, primary key
#  unidade_saude                      :string
#  prontuario                         :string
#  data_diagnostico                   :date
#  classificacao_operacional          :string
#  forma_clinica                      :string
#  baciloscopia                       :string
#  baciloscopia_lb                    :string
#  grau_incapacidade                  :string
#  inicio_tratamento                  :date
#  esquema_terapeutico                :string
#  tempo_tratamento                   :integer
#  doses                              :integer
#  regularidade                       :boolean
#  tratamento_observacoes             :string
#  tempo_alta_cura                    :integer
#  data_primeiros_sintomas            :date
#  grau_incapacidade_alta             :string
#  classificacao_operacional_alta     :string
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  termino_tratamento                 :date
#  forma_clinica_alta                 :string
#  baciloscopia_suspeita              :string
#  baciloscopia_lb_suspeita           :string
#  grau_incapacidade_suspeita         :string
#  classificacao_operacional_suspeita :string
#  forma_clinica_suspeita             :string
#  paciente_id                        :integer
#
# Indexes
#
#  index_recidivas_on_paciente_id  (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (paciente_id => pacientes.id)
#

require 'test_helper'

class RecidivaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
