class AddAnoToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :ano, :integer
  end
end
