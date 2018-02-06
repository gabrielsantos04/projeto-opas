class CreateRecidivas < ActiveRecord::Migration[5.1]
  def change
    create_table :recidivas do |t|
      t.string :unidade_saude
      t.string :prontuario
      t.date :data_diagnostico
      t.string :classificacao_operacional
      t.string :forma_clinica
      t.string :baciloscopia
      t.string :baciloscopia_lb
      t.string :grau_incapacidade
      t.date :inicio_tratamento
      t.string :esquema_terapeutico
      t.integer :tempo_tratamento
      t.integer :doses
      t.boolean :regularidade
      t.string :termino_tratamento
      t.string :tratamento_observacoes
      t.integer :tempo_alta_cura
      t.date :data_primeiros_sintomas
      t.string :baciloscopia_alta
      t.string :baciloscopia_lb_alta
      t.string :grau_incapacidade_alta
      t.string :classificacao_operacional_alta
      t.references :notificacao, foreign_key: true

      t.timestamps
    end
  end
end
