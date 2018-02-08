class AddClassificacaoToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :recidivas, :classificacao_operacional_suspeita, :string
    add_column :recidivas, :forma_clinica_suspeita, :string
  end
end
