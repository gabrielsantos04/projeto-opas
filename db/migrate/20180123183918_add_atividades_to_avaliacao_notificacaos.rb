class AddAtividadesToAvaliacaoNotificacaos < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_notificacaos, :atividades_orientadas, :boolean
  end
end
