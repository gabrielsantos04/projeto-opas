# == Schema Information
#
# Table name: dados_clinicos
#
#  id                        :integer          not null, primary key
#  lesoes_cultaneas          :integer
#  forma_clinica             :string
#  classificacao_operacional :string
#  nervos_afetados           :integer
#  notificacao_id            :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_dados_clinicos_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

require 'test_helper'

class DadosClinicoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
