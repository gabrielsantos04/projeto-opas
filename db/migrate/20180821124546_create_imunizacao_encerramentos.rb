class CreateImunizacaoEncerramentos < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_encerramentos do |t|
      t.references :imunizacao_esquema, foreign_key: true
      t.date :data_administracao
      t.string :lote
      t.date :validade
      t.string :laboratorio
      t.string :unidade_administracao
      t.string :via_administracao
      t.string :profissional
      t.text :observacoes

      t.timestamps
    end
  end
end
