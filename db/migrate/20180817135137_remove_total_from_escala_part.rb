class RemoveTotalFromEscalaPart < ActiveRecord::Migration[5.1]
  def change
    remove_column :escala_parts, :total, :string
  end
end
