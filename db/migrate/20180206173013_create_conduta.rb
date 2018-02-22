class CreateConduta < ActiveRecord::Migration[5.1]
  def change
    create_table :conduta do |t|
      t.string :nome

      t.timestamps
    end
  end
end
