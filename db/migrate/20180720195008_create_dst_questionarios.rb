class CreateDstQuestionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_questionarios do |t|
      t.string :titulo
      t.text :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
