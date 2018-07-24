# == Schema Information
#
# Table name: dst_questionarios
#
#  id         :integer          not null, primary key
#  titulo     :string
#  descricao  :text
#  ativo      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DstQuestionarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
