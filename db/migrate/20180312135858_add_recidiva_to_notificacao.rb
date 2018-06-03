class AddRecidivaToNotificacao < ActiveRecord::Migration[5.1]
  def change
    add_reference :notificacaos, :recidiva, foreign_key: true
  end
end
