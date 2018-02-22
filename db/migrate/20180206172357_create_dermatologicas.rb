class CreateDermatologicas < ActiveRecord::Migration[5.1]
  def change
    create_table :dermatologicas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
