class CreateDantRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_regions do |t|
      t.string :nome

      t.timestamps
    end
  end
end
