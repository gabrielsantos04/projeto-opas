class CreateDstUserLocals < ActiveRecord::Migration[5.1]
  def change
    create_table :dst_user_locals do |t|
      t.references :user, foreign_key: true
      t.references :dst_local, foreign_key: true

      t.timestamps
    end
  end
end
