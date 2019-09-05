# == Schema Information
#
# Table name: dant_doses
#
#  id              :integer          not null, primary key
#  tipo_insulina   :string
#  dose_diaria     :integer
#  frascos_mensais :integer
#  dant_pacient_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_dant_doses_on_dant_pacient_id  (dant_pacient_id)
#
# Foreign Keys
#
#  fk_rails_...  (dant_pacient_id => dant_pacients.id)
#

require 'test_helper'

class DantDoseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
