class CreateDantRequestPacients < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_request_pacients do |t|
      t.references :dant_request, foreign_key: true
      t.references :dant_pacient, foreign_key: true

      t.timestamps
    end
  end
end
