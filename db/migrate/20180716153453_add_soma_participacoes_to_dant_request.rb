class AddSomaParticipacoesToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :soma_participacoes, :integer
  end
end
