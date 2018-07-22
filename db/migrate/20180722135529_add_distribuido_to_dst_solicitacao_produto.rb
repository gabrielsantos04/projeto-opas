class AddDistribuidoToDstSolicitacaoProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacao_produtos, :distribuido, :decimal
  end
end
