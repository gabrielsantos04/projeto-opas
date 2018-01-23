# == Schema Information
#
# Table name: notificacao_contatos
#
#  id             :integer          not null, primary key
#  nome           :string
#  tipo_contato   :string
#  suspeito       :boolean
#  confirmado     :boolean
#  notificacao_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bcg_primeira   :date
#  bcg_segunda    :date
#  bcg_cicatriz   :boolean
#
# Indexes
#
#  index_notificacao_contatos_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

class NotificacaoContato < ApplicationRecord
  belongs_to :notificacao

  extend Enumerize
  enumerize :tipo_contato, in: [:domiciliar, :vizinhanca,:social], predicate: true
end
