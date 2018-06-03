class AddCodigoToOcupacao < ActiveRecord::Migration[5.1]
  def change
    add_column :ocupacaos, :codigo, :string
  end
end
