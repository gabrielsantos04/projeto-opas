class CreateEscalaParts < ActiveRecord::Migration[5.1]
  def change
    create_table :escala_parts do |t|
      t.string :questao_1
      t.integer :questao_1_valor
      t.string :questao_2
      t.integer :questao_2_valor
      t.string :questao_3
      t.integer :questao_3_valor
      t.string :questao_4
      t.integer :questao_4_valor
      t.string :questao_5
      t.integer :questao_5_valor
      t.string :questao_6
      t.integer :questao_6_valor
      t.string :questao_7
      t.integer :questao_7_valor
      t.string :questao_8
      t.integer :questao_8_valor
      t.string :questao_9
      t.integer :questao_9_valor
      t.string :questao_10
      t.integer :questao_10_valor
      t.string :questao_11
      t.integer :questao_11_valor
      t.string :questao_12
      t.integer :questao_12_valor
      t.string :questao_13
      t.integer :questao_13_valor
      t.string :questao_14
      t.integer :questao_14_valor
      t.string :questao_15
      t.integer :questao_15_valor
      t.string :questao_16
      t.integer :questao_16_valor
      t.string :questao_17
      t.integer :questao_17_valor
      t.string :questao_18
      t.integer :questao_18_valor
      t.date :data_entrevista
      t.string :entrevistador
      t.string :total
      t.string :grau_restricao
      t.text :comentario
      t.references :paciente, foreign_key: true
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
