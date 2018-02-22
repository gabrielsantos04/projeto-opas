class AddNumeroEpisodiosToEpidosiosReacionaisRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :epidosios_reacionais_recidivas, :numero_episodios, :integer
  end
end
