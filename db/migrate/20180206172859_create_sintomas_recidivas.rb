class CreateSintomasRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :sintomas_recidivas do |t|
      t.references :sinais_sintoma, foreign_key: true
      t.references :recidiva, foreign_key: true

      t.timestamps
    end
  end
end
