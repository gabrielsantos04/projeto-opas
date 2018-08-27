class CreateImunizacaoVacinas < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_vacinas do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
