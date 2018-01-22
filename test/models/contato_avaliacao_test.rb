# == Schema Information
#
# Table name: contato_avaliacaos
#
#  id                     :integer          not null, primary key
#  data                   :date
#  suspeito               :boolean
#  confirmado             :boolean
#  notificacao_contato_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_contato_avaliacaos_on_notificacao_contato_id  (notificacao_contato_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_contato_id => notificacao_contatos.id)
#

require 'test_helper'

class ContatoAvaliacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
