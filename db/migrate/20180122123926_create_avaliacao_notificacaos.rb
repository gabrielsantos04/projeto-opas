class CreateAvaliacaoNotificacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliacao_notificacaos do |t|
      t.string :classificacao_operacional
      t.date :inicio_pqt
      t.date :alta_pqt
      t.string :profissao
      t.string :unidade_saude
      t.boolean :atividades_realizadas_ubs
      t.boolean :grupo_autocuidado
      t.string :encaminhamentos
      t.string :imobilizacoes
      t.string :adaptacoes
      t.string :observacoes
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
