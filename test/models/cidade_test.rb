# == Schema Information
#
# Table name: cidades
#
#  id              :integer          not null, primary key
#  nome            :string
#  uf              :string
#  latitude        :string
#  longitude       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  pacientes_count :integer          default(0)
#

require 'test_helper'

class CidadeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
