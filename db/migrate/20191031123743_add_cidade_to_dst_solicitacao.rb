class AddCidadeToDstSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_reference :dst_solicitacaos, :cidade, foreign_key: true
  end
end
