# == Schema Information
#
# Table name: esquema_substitutivos
#
#  id             :integer          not null, primary key
#  miligramas     :decimal(, )
#  medicamento_id :integer
#  notificacao_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_esquema_substitutivos_on_medicamento_id  (medicamento_id)
#  index_esquema_substitutivos_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (medicamento_id => medicamentos.id)
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

class EsquemaSubstitutivo < ApplicationRecord
  belongs_to :medicamento
  belongs_to :notificacao

  validates :medicamento_id, presence: true
end
