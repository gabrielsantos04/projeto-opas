class AddBgcToNotificacaoContatos < ActiveRecord::Migration[5.1]
  def change
    add_column :notificacao_contatos, :bcg_primeira, :date
    add_column :notificacao_contatos, :bcg_segunda, :date
    add_column :notificacao_contatos, :bcg_cicatriz, :boolean
  end
end
