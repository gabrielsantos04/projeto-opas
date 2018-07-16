class RemoveFrascosFromDantPacient < ActiveRecord::Migration[5.1]
  def change
    remove_column :dant_pacients, :frascos_diarios, :string
    remove_column :dant_pacients, :frascos_mensais, :string
  end
end
