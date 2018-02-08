# == Schema Information
#
# Table name: nervos_recidivas
#
#  id          :integer          not null, primary key
#  nervo       :string
#  recidiva_id :integer
#  momento     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_nervos_recidivas_on_recidiva_id  (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class NervosRecidiva < ApplicationRecord
  belongs_to :recidiva, optional: true

  extend Enumerize
  enumerize :nervo, in: [:auricular, :mediano,:radial,:ulnar,:fibular_comum,:tibial_posterior], predicate: true
end
