class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :nome_mae
      t.integer :idade
      t.decimal :peso
      t.string :endereco
      t.string :latitude
      t.string :longitude
      t.integer :sexo
      t.string :telefone
      t.references :cidade, foreign_key: true
      t.references :ocupacao, foreign_key: true

      t.timestamps
    end
  end
end
