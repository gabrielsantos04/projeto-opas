# == Schema Information
#
# Table name: notificacaos
#
#  id                       :integer          not null, primary key
#  numero                   :string
#  data                     :date
#  grau_incapacidade        :string
#  modo_entrada             :string
#  modo_deteccao            :string
#  observacoes              :string
#  baciloscopia             :string
#  data_inicio              :date
#  esquema_terapeutico      :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  paciente_id              :integer
#  recidiva_id              :integer
#  avaliacao_notificacao_id :integer
#
# Indexes
#
#  index_notificacaos_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#  index_notificacaos_on_paciente_id               (paciente_id)
#  index_notificacaos_on_recidiva_id               (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

require 'test_helper'

class NotificacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
