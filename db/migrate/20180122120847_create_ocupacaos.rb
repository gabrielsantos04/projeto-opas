class CreateOcupacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :ocupacaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
