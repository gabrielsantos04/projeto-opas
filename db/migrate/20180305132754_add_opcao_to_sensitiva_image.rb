class AddOpcaoToSensitivaImage < ActiveRecord::Migration[5.1]
  def change
    add_column :sensitiva_images, :opcao, :string
  end
end
