class RemoveNervoUltarEFromAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    remove_column :avaliacao_neurologicas, :nervo_ultar_e, :string
  end
end
