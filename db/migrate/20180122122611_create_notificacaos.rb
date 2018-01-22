class CreateNotificacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :notificacaos do |t|
      t.string :numero
      t.date :data
      t.string :grau_incapacidade
      t.string :modo_entrada
      t.string :modo_deteccao
      t.string :observacoes
      t.string :baciloscopia
      t.date :data_inicio
      t.string :esquema_terapeutico

      t.timestamps
    end
  end
end
