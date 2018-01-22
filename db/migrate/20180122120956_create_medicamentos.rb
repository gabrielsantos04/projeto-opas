class CreateMedicamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :medicamentos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
