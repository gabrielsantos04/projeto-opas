class AddSaldoToDstSolicitacaoProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacao_produtos, :saldo_anterior, :integer
    add_column :dst_solicitacao_produtos, :entradas_ms, :integer
    add_column :dst_solicitacao_produtos, :qtd_remanejado, :integer
    add_column :dst_solicitacao_produtos, :qtd_perdas, :integer
    add_column :dst_solicitacao_produtos, :saldo_final, :integer
  end
end
