class AddDeferimentoToImunizacaoSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_solicitacaos, :deferimento, :text
  end
end
