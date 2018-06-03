class CreateSensitivaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :sensitiva_images do |t|
      t.string :imagem
      t.references :avaliacao_sensitiva, foreign_key: true

      t.timestamps
    end
  end
end
