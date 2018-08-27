class AddImunizacaoImunobiologicoToImunizacaoEsquema < ActiveRecord::Migration[5.1]
  def change
    add_reference :imunizacao_esquemas, :imunizacao_imunobiologico, foreign_key: true
  end
end
