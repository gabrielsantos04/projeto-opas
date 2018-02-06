class CreateDermatologicoRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :dermatologico_recidivas do |t|
      t.references :dermatologica, foreign_key: true
      t.string :momento
      t.references :recidiva, foreign_key: true

      t.timestamps
    end
  end
end
