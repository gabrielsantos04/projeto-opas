class CreateCondutaRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :conduta_recidivas do |t|
      t.references :condutas, foreign_key: true
      t.references :recidiva, foreign_key: true

      t.timestamps
    end
  end
end
