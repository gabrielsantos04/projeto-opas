class CreateDiagnosticos < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnosticos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
