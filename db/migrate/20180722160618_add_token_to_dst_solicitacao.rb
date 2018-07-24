class AddTokenToDstSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacaos, :token, :string
  end
end
