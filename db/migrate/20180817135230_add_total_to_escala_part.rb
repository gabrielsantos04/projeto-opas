class AddTotalToEscalaPart < ActiveRecord::Migration[5.1]
  def change
    add_column :escala_parts, :total, :integer
  end
end
