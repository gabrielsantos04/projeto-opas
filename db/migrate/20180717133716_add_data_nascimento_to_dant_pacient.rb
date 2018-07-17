class AddDataNascimentoToDantPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_pacients, :data_nascimento, :date
  end
end
