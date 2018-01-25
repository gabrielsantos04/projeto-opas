class AddPeToAvaliacaoSensitivas < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliacao_sensitivas, :pe_d_e2, :integer
  end
end
