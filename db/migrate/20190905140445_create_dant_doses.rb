class CreateDantDoses < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_doses do |t|
      t.string :tipo_insulina
      t.integer :dose_diaria
      t.integer :frascos_mensais
      t.references :dant_pacient, foreign_key: true

      t.timestamps
    end
  end
end
