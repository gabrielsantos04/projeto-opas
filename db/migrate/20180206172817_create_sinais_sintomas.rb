class CreateSinaisSintomas < ActiveRecord::Migration[5.1]
  def change
    create_table :sinais_sintomas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
