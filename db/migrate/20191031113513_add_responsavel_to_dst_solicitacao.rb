class AddResponsavelToDstSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacaos, :responsavel, :string
    add_column :dst_solicitacaos, :cargo_funcao, :string
    add_column :dst_solicitacaos, :contato, :string
  end
end
