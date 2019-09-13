# == Schema Information
#
# Table name: imunizacao_imunobiologicos
#
#  id                          :integer          not null, primary key
#  tipo                        :string
#  nome_vacina                 :string
#  imunizacao_vacina_id        :integer
#  imunizacao_solicitacao_id   :integer
#  status                      :string
#  justificativa_indeferimento :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  imunizacao_indication_id    :integer
#
# Indexes
#
#  index_imunizacao_imunobiologicos_on_imunizacao_indication_id   (imunizacao_indication_id)
#  index_imunizacao_imunobiologicos_on_imunizacao_solicitacao_id  (imunizacao_solicitacao_id)
#  index_imunizacao_imunobiologicos_on_imunizacao_vacina_id       (imunizacao_vacina_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_indication_id => imunizacao_indications.id)
#  fk_rails_...  (imunizacao_solicitacao_id => imunizacao_solicitacaos.id)
#  fk_rails_...  (imunizacao_vacina_id => imunizacao_vacinas.id)
#

require 'test_helper'

class ImunizacaoImunobiologicoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
