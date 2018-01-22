class CreateContatoAvaliacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :contato_avaliacaos do |t|
      t.date :data
      t.boolean :suspeito
      t.boolean :confirmado
      t.references :notificacao_contato, foreign_key: true

      t.timestamps
    end
  end
end
