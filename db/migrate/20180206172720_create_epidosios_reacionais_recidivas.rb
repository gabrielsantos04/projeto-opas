class CreateEpidosiosReacionaisRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :epidosios_reacionais_recidivas do |t|
      t.string :tipo
      t.string :conduta_mendicamentosa
      t.string :momento
      t.references :recidiva, foreign_key: true

      t.timestamps
    end
  end
end
