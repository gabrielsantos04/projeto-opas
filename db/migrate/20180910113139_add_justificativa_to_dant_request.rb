class AddJustificativaToDantRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_requests, :justificativa, :text
  end
end
