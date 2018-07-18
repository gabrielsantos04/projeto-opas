# == Schema Information
#
# Table name: dant_request_pacients
#
#  id              :integer          not null, primary key
#  dant_request_id :integer
#  dant_pacient_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  frascos_diarios :integer
#  frascos_mensais :integer
#  idade           :integer
#  hipertenso      :boolean
#  diabetico       :boolean
#  tabagista       :boolean
#  obeso           :boolean
#  etilista        :boolean
#  sexo            :integer
#
# Indexes
#
#  index_dant_request_pacients_on_dant_pacient_id  (dant_pacient_id)
#  index_dant_request_pacients_on_dant_request_id  (dant_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (dant_pacient_id => dant_pacients.id)
#  fk_rails_...  (dant_request_id => dant_requests.id)
#

require 'test_helper'

class DantRequestPacientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
