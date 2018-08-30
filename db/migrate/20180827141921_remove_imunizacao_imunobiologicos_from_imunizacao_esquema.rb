class RemoveImunizacaoImunobiologicosFromImunizacaoEsquema < ActiveRecord::Migration[5.1]
  def change
    remove_column :imunizacao_esquemas, :imunizacao_imunobiologicos_id, :string
  end
end
