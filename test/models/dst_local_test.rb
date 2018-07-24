# == Schema Information
#
# Table name: dst_locals
#
#  id         :integer          not null, primary key
#  nome       :string
#  descricao  :text
#  cidade_id  :integer
#  categoria  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dst_locals_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'test_helper'

class DstLocalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
