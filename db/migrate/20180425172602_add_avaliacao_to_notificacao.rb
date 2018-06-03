class AddAvaliacaoToNotificacao < ActiveRecord::Migration[5.1]
  def change
    add_reference :notificacaos, :avaliacao_notificacao, foreign_key: true
  end
end
