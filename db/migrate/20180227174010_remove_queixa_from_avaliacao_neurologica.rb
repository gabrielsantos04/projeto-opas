class RemoveQueixaFromAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    remove_reference :avaliacao_neurologicas, :queixa, foreign_key: true
  end
end
