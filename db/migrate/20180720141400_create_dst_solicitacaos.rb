class CreateDstSolicitacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_solicitacaos do |t|
      t.references :dst_local, foreign_key: true
      t.text :observacoes
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
