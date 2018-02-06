class RemoveTerminoTratamentoFromRecidiva < ActiveRecord::Migration[5.1]
  def change
    remove_column :recidivas, :termino_tratamento, :string
  end
end
