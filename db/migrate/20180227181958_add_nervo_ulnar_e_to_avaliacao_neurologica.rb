class AddNervoUlnarEToAvaliacaoNeurologica < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_neurologicas, :nervo_ulnar_e, :string
  end
end
