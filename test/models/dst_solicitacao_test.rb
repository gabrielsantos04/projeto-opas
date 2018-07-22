# == Schema Information
#
# Table name: dst_solicitacaos
#
#  id           :integer          not null, primary key
#  dst_local_id :integer
#  observacoes  :text
#  user_id      :integer
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  token        :string
#
# Indexes
#
#  index_dst_solicitacaos_on_dst_local_id  (dst_local_id)
#  index_dst_solicitacaos_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class DstSolicitacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
