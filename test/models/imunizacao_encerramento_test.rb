# == Schema Information
#
# Table name: imunizacao_encerramentos
#
#  id                    :integer          not null, primary key
#  imunizacao_esquema_id :integer
#  data_administracao    :date
#  lote                  :string
#  validade              :date
#  laboratorio           :string
#  unidade_administracao :string
#  via_administracao     :string
#  profissional          :string
#  observacoes           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_imunizacao_encerramentos_on_imunizacao_esquema_id  (imunizacao_esquema_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_esquema_id => imunizacao_esquemas.id)
#

require 'test_helper'

class ImunizacaoEncerramentoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
