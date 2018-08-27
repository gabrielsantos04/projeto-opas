class CreateImunizacaoSolicitacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :imunizacao_solicitacaos do |t|
      t.string :nome_paciente
      t.date :data_nascimento
      t.string :sexo
      t.string :nome_mae
      t.text :endereco
      t.string :bairro
      t.integer :municipio_id
      t.text :motivo_solicitacao
      t.string :nome_requisitante
      t.string :tipo_requisitante
      t.string :crm_coren
      t.string :telefone_requisitante
      t.string :instituicao_requisitante
      t.integer :municipio_requisitante_id
      t.text :anexo
      t.string :solicitante
      t.text :observacoes
      t.date :data_atendimento
      t.integer :municipio_atual_id
      t.string :status

      t.timestamps
    end
  end
end
