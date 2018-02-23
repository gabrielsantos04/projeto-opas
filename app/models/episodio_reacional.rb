# == Schema Information
#
# Table name: episodio_reacionals
#
#  id                     :integer          not null, primary key
#  notificacao_id         :integer
#  tipo                   :string
#  numero_episodios       :integer
#  conduta_mendicamentosa :string
#  data_inicio            :date
#  data_termino           :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_episodio_reacionals_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

class EpisodioReacional < ApplicationRecord
  belongs_to :notificacao

  validates_presence_of EpisodioReacional.attribute_names - %w(id  created_at updated_at data_termino numero_episodios notificacao_id)

  extend Enumerize

  enumerize :tipo, in: [:tipo_1, :tipo_2,:tipo_1_2,:neurites,:sem_reacao], predicates: true
end
