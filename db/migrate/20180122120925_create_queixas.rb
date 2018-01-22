class CreateQueixas < ActiveRecord::Migration[5.1]
  def change
    create_table :queixas do |t|
      t.string :nome
      t.string :categoria

      t.timestamps
    end
  end
end
