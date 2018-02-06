class CreateNervosRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :nervos_recidivas do |t|
      t.string :nervo
      t.references :recidiva, foreign_key: true
      t.string :momento

      t.timestamps
    end
  end
end
