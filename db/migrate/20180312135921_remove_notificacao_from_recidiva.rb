class RemoveNotificacaoFromRecidiva < ActiveRecord::Migration[5.1]
  def change
    remove_reference :recidivas, :notificacao, foreign_key: true
  end
end
