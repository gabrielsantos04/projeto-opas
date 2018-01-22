# == Schema Information
#
# Table name: classificacao_graus
#
#  id                       :integer          not null, primary key
#  avaliacao_notificacao_id :integer
#  data                     :date
#  olho_direito             :integer
#  olho_esquerdo            :integer
#  mao_direita              :integer
#  mao_esqueda              :integer
#  pe_direito               :integer
#  pe_esquerdo              :integer
#  maior_grau               :integer
#  escore_omp               :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_classificacao_graus_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#

require 'test_helper'

class ClassificacaoGrauTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
