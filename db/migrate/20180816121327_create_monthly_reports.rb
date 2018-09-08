class CreateMonthlyReports < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_reports do |t|
      t.string :nome_grupo
      t.string :coordenador
      t.string :monitor
      t.string :lider
      t.date :data_reuniao
      t.time :inicio
      t.time :termino
      t.string :local
      t.text :temas
      t.text :atividades_desenvolvidas
      t.datetime :data_proximo
      t.boolean :intercorrencia
      t.integer :outros_agravos
      t.integer :agravo_diabetes
      t.integer :agravo_hipertensao
      t.integer :agravo_avc
      t.integer :analfabetos
      t.integer :qtd_psicologo
      t.integer :qtd_assistente_social
      t.integer :oficina_sapataria
      t.integer :qtd_hanseniase
      t.integer :qtd_sem_hanseniase
      t.integer :qtd_profissionais
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
