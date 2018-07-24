# == Schema Information
#
# Table name: dst_produtos
#
#  id             :integer          not null, primary key
#  nome           :string
#  descricao      :text
#  unidade_medida :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class DstProdutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
