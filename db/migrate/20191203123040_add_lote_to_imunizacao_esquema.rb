class AddLoteToImunizacaoEsquema < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_esquemas, :lote, :string
  end
end
