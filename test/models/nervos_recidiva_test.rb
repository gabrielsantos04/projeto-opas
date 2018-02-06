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

require 'test_helper'

class NervosRecidivaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
