# == Schema Information
#
# Table name: dst_movimentacaos
#
#  id                         :integer          not null, primary key
#  dst_produto_id             :integer
#  tipo                       :string
#  categoria                  :string
#  quantidade                 :decimal(, )
#  dst_lote_id                :integer
#  descricao                  :text
#  dst_local_id               :integer
#  dst_solicitacao_produto_id :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_dst_movimentacaos_on_dst_local_id                (dst_local_id)
#  index_dst_movimentacaos_on_dst_lote_id                 (dst_lote_id)
#  index_dst_movimentacaos_on_dst_produto_id              (dst_produto_id)
#  index_dst_movimentacaos_on_dst_solicitacao_produto_id  (dst_solicitacao_produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (dst_lote_id => dst_lotes.id)
#  fk_rails_...  (dst_produto_id => dst_produtos.id)
#  fk_rails_...  (dst_solicitacao_produto_id => dst_solicitacao_produtos.id)
#

require 'test_helper'

class DstMovimentacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
