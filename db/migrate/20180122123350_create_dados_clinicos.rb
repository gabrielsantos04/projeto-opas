class CreateDadosClinicos < ActiveRecord::Migration[5.1]
  def change
    create_table :dados_clinicos do |t|
      t.integer :lesoes_cultaneas
      t.string :forma_clinica
      t.string :classificacao_operacional
      t.integer :nervos_afetados
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
