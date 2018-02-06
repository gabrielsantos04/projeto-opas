class AddTerminoTratamentoToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :recidivas, :termino_tratamento, :date
  end
end
