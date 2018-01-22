class CreateNotificacaoContatos < ActiveRecord::Migration[5.1]
  def change
    create_table :notificacao_contatos do |t|
      t.string :nome
      t.string :tipo_contato
      t.boolean :suspeito
      t.boolean :confirmado
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
