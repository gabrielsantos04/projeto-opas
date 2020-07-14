class AddLoteToDstSolicitacaoProduto < ActiveRecord::Migration[5.1]
  def change
    add_reference :dst_solicitacao_produtos, :dst_lote, foreign_key: true
  end
end
