class AddObservacoesToDstSolicitacaoProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacao_produtos, :observacoes, :text
    add_column :dst_solicitacao_produtos, :quantidade_aprovada, :decimal
  end
end
