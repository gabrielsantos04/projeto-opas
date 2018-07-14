class CreateDantResponsavelPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_responsavel_programs do |t|
      t.string :nome
      t.string :cargo
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
