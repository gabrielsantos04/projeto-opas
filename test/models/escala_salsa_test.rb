# == Schema Information
#
# Table name: escala_salsas
#
#  id                   :integer          not null, primary key
#  paciente_id          :integer
#  notificacao_id       :integer
#  data_entrevista      :date
#  entrevistador        :string
#  questao_1            :integer
#  questao_2            :integer
#  questao_3            :integer
#  questao_4            :integer
#  questao_5            :integer
#  questao_6            :integer
#  questao_7            :integer
#  questao_8            :integer
#  questao_9            :integer
#  questao_10           :integer
#  questao_11           :integer
#  questao_12           :integer
#  questao_13           :integer
#  questao_14           :integer
#  questao_15           :integer
#  questao_16           :integer
#  questao_17           :integer
#  questao_18           :integer
#  questao_19           :integer
#  questao_20           :integer
#  escore_facil         :integer
#  escore_pouco_dificil :integer
#  escore_muito_dificil :integer
#  escore_nao_preciso   :integer
#  escore_fisicamente   :integer
#  escore_evito         :integer
#  escore_salsa         :integer
#  escore_risco         :integer
#  condicoes_medicas    :text
#  adaptacoes           :text
#  responsavel          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_escala_salsas_on_notificacao_id  (notificacao_id)
#  index_escala_salsas_on_paciente_id     (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#

require 'test_helper'

class EscalaSalsaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
