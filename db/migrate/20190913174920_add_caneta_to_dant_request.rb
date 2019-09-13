class AddCanetaToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :qtd_nph_caneta, :integer
    add_column :dant_requests, :qtd_frascos_nph_caneta, :integer
    add_column :dant_requests, :qtd_regular_caneta, :integer
    add_column :dant_requests, :qtd_frascos_regular_caneta, :integer
  end
end
