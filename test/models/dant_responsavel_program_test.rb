# == Schema Information
#
# Table name: dant_responsavel_programs
#
#  id         :integer          not null, primary key
#  nome       :string
#  cargo      :string
#  cidade_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dant_responsavel_programs_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'test_helper'

class DantResponsavelProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
