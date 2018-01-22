class CreateAvaliacaoNeurologicas < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliacao_neurologicas do |t|
      t.references :queixa, foreign_key: true
      t.references :avaliacao_notificacao, foreign_key: true
      t.string :direito
      t.string :esquerdo
      t.date :data

      t.timestamps
    end
  end
end
