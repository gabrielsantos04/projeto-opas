class RemoveCorneadaFromAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    remove_column :avaliacao_neurologicas, :opacidade_corneada_e, :string
  end
end
