class AddIdadeToDantRequestPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_request_pacients, :idade, :integer
  end
end
