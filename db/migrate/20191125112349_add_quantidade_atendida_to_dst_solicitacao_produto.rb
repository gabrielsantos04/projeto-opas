class AddQuantidadeAtendidaToDstSolicitacaoProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacao_produtos, :quantidade_atendido, :integer
  end
end
