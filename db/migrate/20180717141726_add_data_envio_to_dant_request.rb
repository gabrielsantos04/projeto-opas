class AddDataEnvioToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :data_envio, :datetime
  end
end
