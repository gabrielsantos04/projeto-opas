# == Schema Information
#
# Table name: dant_cidade_regions
#
#  id             :integer          not null, primary key
#  dant_region_id :integer
#  cidade_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_dant_cidade_regions_on_cidade_id       (cidade_id)
#  index_dant_cidade_regions_on_dant_region_id  (dant_region_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (dant_region_id => dant_regions.id)
#

require 'test_helper'

class DantCidadeRegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
