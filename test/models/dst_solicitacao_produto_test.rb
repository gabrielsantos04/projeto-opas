# == Schema Information
#
# Table name: dst_solicitacao_produtos
#
#  id                  :integer          not null, primary key
#  dst_produto_id      :integer
#  quantidade          :decimal(, )
#  status              :string
#  dst_solicitacao_id  :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distribuido         :decimal(, )
#  observacoes         :text
#  quantidade_aprovada :decimal(, )
#  user_id             :integer
#  saldo_anterior      :integer
#  entradas_ms         :integer
#  qtd_remanejado      :integer
#  qtd_perdas          :integer
#  saldo_final         :integer
#  quantidade_atendido :integer
#  dst_lote_id         :integer
#
# Indexes
#
#  index_dst_solicitacao_produtos_on_dst_lote_id         (dst_lote_id)
#  index_dst_solicitacao_produtos_on_dst_produto_id      (dst_produto_id)
#  index_dst_solicitacao_produtos_on_dst_solicitacao_id  (dst_solicitacao_id)
#  index_dst_solicitacao_produtos_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_lote_id => dst_lotes.id)
#  fk_rails_...  (dst_produto_id => dst_produtos.id)
#  fk_rails_...  (dst_solicitacao_id => dst_solicitacaos.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class DstSolicitacaoProdutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
