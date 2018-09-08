class CreateEscalaSalsas < ActiveRecord::Migration[5.1]
  def change
    create_table :escala_salsas do |t|
      t.references :paciente, foreign_key: true
      t.references :notificacao, foreign_key: true
      t.date :data_entrevista
      t.string :entrevistador
      t.integer :questao_1
      t.integer :questao_2
      t.integer :questao_3
      t.integer :questao_4
      t.integer :questao_5
      t.integer :questao_6
      t.integer :questao_7
      t.integer :questao_8
      t.integer :questao_9
      t.integer :questao_10
      t.integer :questao_11
      t.integer :questao_12
      t.integer :questao_13
      t.integer :questao_14
      t.integer :questao_15
      t.integer :questao_16
      t.integer :questao_17
      t.integer :questao_18
      t.integer :questao_19
      t.integer :questao_20
      t.integer :escore_facil
      t.integer :escore_pouco_dificil
      t.integer :escore_muito_dificil
      t.integer :escore_nao_preciso
      t.integer :escore_fisicamente
      t.integer :escore_evito
      t.integer :escore_salsa
      t.integer :escore_risco
      t.text :condicoes_medicas
      t.text :adaptacoes
      t.string :responsavel

      t.timestamps
    end
  end
end
