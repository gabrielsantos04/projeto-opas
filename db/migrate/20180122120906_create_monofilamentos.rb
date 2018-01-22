class CreateMonofilamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :monofilamentos do |t|
      t.string :nome
      t.string :cor
      t.string :interpretacao

      t.timestamps
    end
  end
end
