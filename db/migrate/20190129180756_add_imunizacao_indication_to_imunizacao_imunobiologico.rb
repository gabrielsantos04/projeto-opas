class AddImunizacaoIndicationToImunizacaoImunobiologico < ActiveRecord::Migration[5.1]
  def change
    add_reference :imunizacao_imunobiologicos, :imunizacao_indication, foreign_key: true
  end
end
