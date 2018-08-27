class CreateImunizacaoImunobiologicos < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_imunobiologicos do |t|
      t.string :tipo
      t.string :nome_vacina
      t.references :imunizacao_vacina, foreign_key: true
      t.references :imunizacao_solicitacao, foreign_key: true
      t.string :status
      t.text :justificativa_indeferimento

      t.timestamps
    end
  end
end
