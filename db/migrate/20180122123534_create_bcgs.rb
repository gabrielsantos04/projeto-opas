class CreateBcgs < ActiveRecord::Migration[5.1]
  def change
    create_table :bcgs do |t|
      t.date :primeira_dose
      t.date :segunda_dose
      t.boolean :cicatriz
      t.references :notificacao_contato, foreign_key: true

      t.timestamps
    end
  end
end
