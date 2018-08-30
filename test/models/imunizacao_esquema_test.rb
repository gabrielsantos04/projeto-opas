# == Schema Information
#
# Table name: imunizacao_esquemas
#
#  id                           :integer          not null, primary key
#  dose                         :string
#  esquema                      :string
#  status                       :string
#  justificativa                :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  imunizacao_imunobiologico_id :integer
#
# Indexes
#
#  index_imunizacao_esquemas_on_imunizacao_imunobiologico_id  (imunizacao_imunobiologico_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_imunobiologico_id => imunizacao_imunobiologicos.id)
#

require 'test_helper'

class ImunizacaoEsquemaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
