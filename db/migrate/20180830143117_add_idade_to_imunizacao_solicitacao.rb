class AddIdadeToImunizacaoSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_solicitacaos, :idade, :integer
  end
end
