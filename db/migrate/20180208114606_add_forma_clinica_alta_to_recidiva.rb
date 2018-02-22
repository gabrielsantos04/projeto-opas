class AddFormaClinicaAltaToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :recidivas, :forma_clinica_alta, :string
  end
end
