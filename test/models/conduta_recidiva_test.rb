# == Schema Information
#
# Table name: conduta_recidivas
#
#  id          :integer          not null, primary key
#  conduta_id  :integer
#  recidiva_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_conduta_recidivas_on_conduta_id   (conduta_id)
#  index_conduta_recidivas_on_recidiva_id  (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (conduta_id => condutas.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

require 'test_helper'

class CondutaRecidivaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
