class CreateAvaliacaoSensitivas < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliacao_sensitivas do |t|
      t.references :avaliacao_notificacao, foreign_key: true
      t.date :data
      t.integer :dedao_direito
      t.integer :indicador_d_ponta
      t.integer :indicador_d
      t.integer :mindinho_d_ponta
      t.integer :mindinho_d
      t.integer :mao_direita
      t.integer :mao_d_costa
      t.integer :dedao_esquerdo
      t.integer :indicador_e_ponta
      t.integer :indicador_e
      t.integer :mindinho_e_ponta
      t.integer :mindinho_e
      t.integer :mao_esquerda
      t.integer :mao_e_costa
      t.integer :pe_direito
      t.integer :pe_d_1_ponta
      t.integer :pe_d_3_ponta
      t.integer :pe_d_5_ponta
      t.integer :pe_d_1
      t.integer :pe_d_3
      t.integer :pe_d_5
      t.integer :pe_d_e1
      t.integer :pe_d_e1
      t.integer :pe_d_calcanhar
      t.integer :pe_esquerdo
      t.integer :pe_e_1_ponta
      t.integer :pe_e_3_ponta
      t.integer :pe_e_5_ponta
      t.integer :pe_e_1
      t.integer :pe_e_3
      t.integer :pe_e_5
      t.integer :pe_e_e1
      t.integer :pe_e_e2
      t.integer :pe_e_calcanhar

      t.timestamps
    end
  end
end
