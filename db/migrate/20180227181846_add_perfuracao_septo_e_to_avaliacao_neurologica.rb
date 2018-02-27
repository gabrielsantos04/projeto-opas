class AddPerfuracaoSeptoEToAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_neurologicas, :perfuracao_septo_e, :string
  end
end
