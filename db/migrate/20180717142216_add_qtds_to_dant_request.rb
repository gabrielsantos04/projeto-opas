class AddQtdsToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :qtd_nph_calculada, :integer
    add_column :dant_requests, :qtd_regular_calculada, :integer
    add_column :dant_requests, :qtd_analoga_calculada, :integer
  end
end
