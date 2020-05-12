class RemoveVacinaFromImunizacaoIndication < ActiveRecord::Migration[5.1]
  def change
    remove_column :imunizacao_indications, :imunizacao_vacina_id, :string
  end
end
