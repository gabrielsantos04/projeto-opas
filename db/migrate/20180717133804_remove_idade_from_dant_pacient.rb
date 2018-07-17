class RemoveIdadeFromDantPacient < ActiveRecord::Migration[5.1]
  def change
    remove_column :dant_pacients, :idade, :integer
  end
end
