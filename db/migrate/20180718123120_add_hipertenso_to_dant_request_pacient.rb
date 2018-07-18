class AddHipertensoToDantRequestPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_request_pacients, :hipertenso, :boolean
    add_column :dant_request_pacients, :diabetico, :boolean
    add_column :dant_request_pacients, :tabagista, :boolean
    add_column :dant_request_pacients, :obeso, :boolean
    add_column :dant_request_pacients, :etilista, :boolean
  end
end
