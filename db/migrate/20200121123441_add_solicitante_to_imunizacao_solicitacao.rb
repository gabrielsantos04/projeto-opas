class AddSolicitanteToImunizacaoSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_solicitacaos, :solicitante_tipo, :string
    add_column :imunizacao_solicitacaos, :solicitante_crm_corem, :string
    add_column :imunizacao_solicitacaos, :solicitante_telefone, :string
    add_column :imunizacao_solicitacaos, :solicitante_instituicao, :string
    add_column :imunizacao_solicitacaos, :solicitante_municipio, :integer
  end
end
