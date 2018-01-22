# == Schema Information
#
# Table name: avaliacao_neurologicas
#
#  id                       :integer          not null, primary key
#  queixa_id                :integer
#  avaliacao_notificacao_id :integer
#  direito                  :string
#  esquerdo                 :string
#  data                     :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_avaliacao_neurologicas_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#  index_avaliacao_neurologicas_on_queixa_id                 (queixa_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#  fk_rails_...  (queixa_id => queixas.id)
#

class AvaliacaoNeurologica < ApplicationRecord
  belongs_to :queixa
  belongs_to :avaliacao_notificacao
end
