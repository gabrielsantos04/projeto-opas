class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.references :cidade, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
