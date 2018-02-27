class RemovePerfuracapSeptoEFromAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    remove_column :avaliacao_neurologicas, :perfuracap_septo_e, :string
  end
end
