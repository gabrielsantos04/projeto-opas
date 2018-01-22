class CreateEpisodioReacionals < ActiveRecord::Migration[5.1]
  def change
    create_table :episodio_reacionals do |t|
      t.references :notificacao, foreign_key: true
      t.string :tipo
      t.integer :numero_episodios
      t.string :conduta_mendicamentosa
      t.date :data_inicio
      t.date :data_termino

      t.timestamps
    end
  end
end
