class AddAnexosToImunizacaoSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_solicitacaos, :anexos, :json
  end
end
