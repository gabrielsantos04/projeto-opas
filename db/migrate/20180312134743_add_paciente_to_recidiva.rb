class AddPacienteToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_reference :recidivas, :paciente, foreign_key: true
  end
end
