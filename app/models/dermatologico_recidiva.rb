# == Schema Information
#
# Table name: dermatologico_recidivas
#
#  id               :integer          not null, primary key
#  dermatologica_id :integer
#  momento          :string
#  recidiva_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_dermatologico_recidivas_on_dermatologica_id  (dermatologica_id)
#  index_dermatologico_recidivas_on_recidiva_id       (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (dermatologica_id => dermatologicas.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class DermatologicoRecidiva < ApplicationRecord
  belongs_to :dermatologica
  belongs_to :recidiva, optional: true
end
