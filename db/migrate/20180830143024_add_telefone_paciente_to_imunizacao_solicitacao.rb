class AddTelefonePacienteToImunizacaoSolicitacao < ActiveRecord::Migration[5.1]
  def change
    add_column :imunizacao_solicitacaos, :telefone_paciente, :string
  end
end
