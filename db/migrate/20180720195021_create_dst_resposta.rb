class CreateDstResposta < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_resposta do |t|
      t.references :dst_questionario, foreign_key: true
      t.references :dst_solicitacao, foreign_key: true
      t.string :valor

      t.timestamps
    end
  end
end
