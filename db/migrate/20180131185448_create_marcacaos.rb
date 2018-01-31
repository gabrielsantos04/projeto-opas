class CreateMarcacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :marcacaos do |t|
      t.references :avaliacao_sensitiva, foreign_key: true
      t.string :imagem
      t.integer :posicaox
      t.integer :posicaoy
      t.string :membro

      t.timestamps
    end
  end
end
