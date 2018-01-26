class AddPacientesCountToCidade < ActiveRecord::Migration[5.1]
  def change
    add_column :cidades, :pacientes_count, :integer, default: 0
  end
end
