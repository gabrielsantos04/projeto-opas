class AddStatusToCidade < ActiveRecord::Migration[5.1]
  def change
    add_column :cidades, :status, :boolean
  end
end
