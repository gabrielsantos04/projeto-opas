class CreateDiagnosticoRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostico_recidivas do |t|
      t.references :recidiva, foreign_key: true
      t.references :diagnostico, foreign_key: true

      t.timestamps
    end
  end
end
