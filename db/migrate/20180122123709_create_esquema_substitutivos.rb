class CreateEsquemaSubstitutivos < ActiveRecord::Migration[5.1]
  def change
    create_table :esquema_substitutivos do |t|
      t.decimal :miligramas
      t.references :medicamento, foreign_key: true
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
