class CreateDstLotes < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_lotes do |t|
      t.references :dst_produto, foreign_key: true
      t.string :nome
      t.text :descricao
      t.date :validade

      t.timestamps
    end
  end
end
