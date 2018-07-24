class CreateDstSolicitacaoProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_solicitacao_produtos do |t|
      t.references :dst_produto, foreign_key: true
      t.decimal :quantidade
      t.string :status
      t.references :dst_solicitacao, foreign_key: true

      t.timestamps
    end
  end
end
