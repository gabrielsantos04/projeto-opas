class AddStatusToDstProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :dst_produtos, :status, :boolean
  end
end
