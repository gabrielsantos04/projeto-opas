# == Schema Information
#
# Table name: epidosios_reacionais_recidivas
#
#  id                     :integer          not null, primary key
#  tipo                   :string
#  conduta_mendicamentosa :string
#  momento                :string
#  recidiva_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  numero_episodios       :integer
#
# Indexes
#
#  index_epidosios_reacionais_recidivas_on_recidiva_id  (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class EpidosiosReacionaisRecidiva < ApplicationRecord
  belongs_to :recidiva, optional: true

  extend Enumerize

  enumerize :tipo, in: [:tipo_1, :tipo_2,:tipo_1_2,:neurites,:sem_reacao], predicates: true
end
