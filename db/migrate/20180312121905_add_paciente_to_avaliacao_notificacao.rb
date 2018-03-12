class AddPacienteToAvaliacaoNotificacao < ActiveRecord::Migration[5.1]
  def change
    add_reference :avaliacao_notificacaos, :paciente, foreign_key: true
  end
end
