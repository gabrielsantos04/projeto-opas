class CreateImunizacaoIndications < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_indications do |t|
      t.string :descricao
      t.references :imunizacao_vacina, foreign_key: true

      t.timestamps
    end
  end
end
