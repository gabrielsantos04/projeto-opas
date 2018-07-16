class AddFrascosToDantRequestPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_request_pacients, :frascos_diarios, :integer
    add_column :dant_request_pacients, :frascos_mensais, :integer
  end
end
