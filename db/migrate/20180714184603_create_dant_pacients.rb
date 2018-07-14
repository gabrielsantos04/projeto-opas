class CreateDantPacients < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_pacients do |t|
      t.string :nome
      t.integer :sexo
      t.string :endereco
      t.string :rg
      t.string :cpf
      t.integer :idade
      t.string :frascos_diarios
      t.string :frascos_mensais
      t.string :tipo_insulina
      t.boolean :hipertenso
      t.boolean :diabetico
      t.boolean :tabagista
      t.boolean :etilista
      t.boolean :obeso
      t.integer :grau_obesidade
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
