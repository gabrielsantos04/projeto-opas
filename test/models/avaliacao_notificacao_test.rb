# == Schema Information
#
# Table name: avaliacao_notificacaos
#
#  id                        :integer          not null, primary key
#  classificacao_operacional :string
#  inicio_pqt                :date
#  alta_pqt                  :date
#  profissao                 :string
#  unidade_saude             :string
#  atividades_realizadas_ubs :boolean
#  grupo_autocuidado         :boolean
#  encaminhamentos           :string
#  imobilizacoes             :string
#  adaptacoes                :string
#  observacoes               :string
#  notificacao_id            :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  atividades_orientadas     :boolean
#  paciente_id               :integer
#  inicial                   :boolean
#
# Indexes
#
#  index_avaliacao_notificacaos_on_notificacao_id  (notificacao_id)
#  index_avaliacao_notificacaos_on_paciente_id     (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#

require 'test_helper'

class AvaliacaoNotificacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
