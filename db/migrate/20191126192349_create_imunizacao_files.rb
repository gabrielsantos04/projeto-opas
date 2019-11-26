class CreateImunizacaoFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_files do |t|
      t.string :descricao
      t.string :anexo
      t.references :imunizacao_solicitacao, foreign_key: true

      t.timestamps
    end
  end
end
