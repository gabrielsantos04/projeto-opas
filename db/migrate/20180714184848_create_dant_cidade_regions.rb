class CreateDantCidadeRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_cidade_regions do |t|
      t.references :dant_region, foreign_key: true
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
