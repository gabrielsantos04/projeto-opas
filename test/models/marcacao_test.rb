# == Schema Information
#
# Table name: marcacaos
#
#  id                     :integer          not null, primary key
#  avaliacao_sensitiva_id :integer
#  imagem                 :string
#  posicaox               :integer
#  posicaoy               :integer
#  membro                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_marcacaos_on_avaliacao_sensitiva_id  (avaliacao_sensitiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_sensitiva_id => avaliacao_sensitivas.id)
#

require 'test_helper'

class MarcacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
