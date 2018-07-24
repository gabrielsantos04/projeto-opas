class CreateDstLocals < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_locals do |t|
      t.string :nome
      t.text :descricao
      t.references :cidade, foreign_key: true
      t.string :categoria

      t.timestamps
    end
  end
end
