class AddCartaoSusToDantPacient < ActiveRecord::Migration[5.1]
  def change
    add_column :dant_pacients, :cartao_sus, :string
  end
end
