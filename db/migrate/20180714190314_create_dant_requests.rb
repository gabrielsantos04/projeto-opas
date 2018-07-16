class CreateDantRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_requests do |t|
      t.integer :qtd_hipertensos
      t.integer :atendimento_hipertensos
      t.integer :qtd_obitos_hipertensos
      t.integer :qtd_diabeticos
      t.integer :atendimento_diabeticos
      t.integer :qtd_obitos_diabeticos
      t.integer :qtd_diabeticos_hipertencos
      t.integer :atendimento_diabeticos_hipertensos
      t.integer :qtd_tratamento_hemodialise
      t.integer :qtd_nph
      t.integer :qtd_frascos_nph
      t.integer :qtd_regular
      t.integer :qtd_frascos_regular
      t.integer :qtd_analoga
      t.integer :qtd_frascos_analoga
      t.integer :qtd_tabagista
      t.integer :qtd_atendimento_tabagista
      t.integer :qtd_etilista
      t.integer :qtd_atendimento_etilista
      t.integer :qtd_obesos
      t.integer :qtd_obesidade_1
      t.integer :qtd_obesidate_2
      t.integer :qtd_obesidade_3
      t.integer :mes
      t.references :dant_responsavel_program, foreign_key: true
      t.references :cidade, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
