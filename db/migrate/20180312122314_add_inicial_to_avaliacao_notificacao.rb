class AddInicialToAvaliacaoNotificacao < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_notificacaos, :inicial, :boolean
  end
end
