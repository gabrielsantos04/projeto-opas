# == Schema Information
#
# Table name: imunizacao_indications
#
#  id                   :integer          not null, primary key
#  descricao            :string
#  imunizacao_vacina_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_imunizacao_indications_on_imunizacao_vacina_id  (imunizacao_vacina_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_vacina_id => imunizacao_vacinas.id)
#

require 'test_helper'

class ImunizacaoIndicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end