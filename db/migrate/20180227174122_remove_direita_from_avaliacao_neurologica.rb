class RemoveDireitaFromAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    remove_column :avaliacao_neurologicas, :direito, :string
    remove_column :avaliacao_neurologicas, :esquerdo, :string
  end
end
