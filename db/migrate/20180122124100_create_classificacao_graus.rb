class CreateClassificacaoGraus < ActiveRecord::Migration[5.1]
  def change
    create_table :classificacao_graus do |t|
      t.references :avaliacao_notificacao, foreign_key: true
      t.date :data
      t.integer :olho_direito
      t.integer :olho_esquerdo
      t.integer :mao_direita
      t.integer :mao_esqueda
      t.integer :pe_direito
      t.integer :pe_esquerdo
      t.integer :maior_grau
      t.integer :escore_omp

      t.timestamps
    end
  end
end
