class AddObitoToDantPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_pacients, :obito, :boolean
    add_column :dant_pacients, :data_obito, :date
  end
end
