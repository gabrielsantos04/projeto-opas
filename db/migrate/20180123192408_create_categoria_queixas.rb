class CreateCategoriaQueixas < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria_queixas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
