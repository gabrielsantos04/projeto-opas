class CreateImunizacaoVacinaIndications < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_vacina_indications do |t|
      t.references :imunizacao_vacina, foreign_key: true
      t.references :imunizacao_indication, foreign_key: true

      t.timestamps
    end
  end
end
