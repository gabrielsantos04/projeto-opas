class CreateConduta < ActiveRecord::Migration[5.1]
  def change
    create_table :condutas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
