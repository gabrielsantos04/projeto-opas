# == Schema Information
#
# Table name: notificacaos
#
#  id                  :integer          not null, primary key
#  numero              :string
#  data                :date
#  grau_incapacidade   :string
#  modo_entrada        :string
#  modo_deteccao       :string
#  observacoes         :string
#  baciloscopia        :string
#  data_inicio         :date
#  esquema_terapeutico :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  paciente_id         :integer
#
# Indexes
#
#  index_notificacaos_on_paciente_id  (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (paciente_id => pacientes.id)
#

class Notificacao < ApplicationRecord
  belongs_to :paciente
end
