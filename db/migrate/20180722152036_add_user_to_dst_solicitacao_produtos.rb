class AddUserToDstSolicitacaoProdutos < ActiveRecord::Migration[5.1]
  def change
    add_reference :dst_solicitacao_produtos, :user, foreign_key: true
  end
end
