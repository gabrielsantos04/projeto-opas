class CreateDstMovimentacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_movimentacaos do |t|
      t.references :dst_produto, foreign_key: true
      t.string :tipo
      t.string :categoria
      t.decimal :quantidade
      t.references :dst_lote, foreign_key: true
      t.text :descricao
      t.references :dst_local, foreign_key: true
      t.references :dst_solicitacao_produto, foreign_key: true

      t.timestamps
    end
  end
end
