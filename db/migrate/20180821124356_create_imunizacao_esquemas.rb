class CreateImunizacaoEsquemas < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_esquemas do |t|
      t.references :imunizacao_imunobiologicos, foreign_key: true
      t.string :dose
      t.string :esquema
      t.string :status
      t.string :justificativa

      t.timestamps
    end
  end
end
