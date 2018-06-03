class AddCorneanaToAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_neurologicas, :opacidade_corneana_e, :string
  end
end
