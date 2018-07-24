class CreateDstProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_produtos do |t|
      t.string :nome
      t.text :descricao
      t.string :unidade_medida

      t.timestamps
    end
  end
end
