class AddAnoToDstSolicitacao < ActiveRecord::Migration[5.2]
  def change
    add_column :dst_solicitacaos, :ano, :integer
  end
end
