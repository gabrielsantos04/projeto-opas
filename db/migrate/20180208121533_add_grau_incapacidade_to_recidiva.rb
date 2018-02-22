class AddGrauIncapacidadeToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :recidivas, :grau_incapacidade_suspeita, :string
  end
end
