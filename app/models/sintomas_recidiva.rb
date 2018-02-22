# == Schema Information
#
# Table name: sintomas_recidivas
#
#  id                :integer          not null, primary key
#  sinais_sintoma_id :integer
#  recidiva_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_sintomas_recidivas_on_recidiva_id        (recidiva_id)
#  index_sintomas_recidivas_on_sinais_sintoma_id  (sinais_sintoma_id)
#
# Foreign Keys
#
#  fk_rails_...  (recidiva_id => recidivas.id)
#  fk_rails_...  (sinais_sintoma_id => sinais_sintomas.id)
#

class SintomasRecidiva < ApplicationRecord
  belongs_to :sinais_sintoma
  belongs_to :recidiva, optional: true
end
