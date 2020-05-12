class AddMesToDstSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_solicitacaos, :mes, :string
  end
end
