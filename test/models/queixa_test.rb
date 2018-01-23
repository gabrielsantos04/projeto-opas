# == Schema Information
#
# Table name: queixas
#
#  id                  :integer          not null, primary key
#  nome                :string
#  categoria           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  categoria_queixa_id :integer
#
# Indexes
#
#  index_queixas_on_categoria_queixa_id  (categoria_queixa_id)
#
# Foreign Keys
#
#  fk_rails_...  (categoria_queixa_id => categoria_queixas.id)
#

require 'test_helper'

class QueixaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
