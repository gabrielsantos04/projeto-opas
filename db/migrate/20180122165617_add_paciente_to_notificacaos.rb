class AddPacienteToNotificacaos < ActiveRecord::Migration[5.1]
  def change
    add_reference :notificacaos, :paciente, foreign_key: true
  end
end
