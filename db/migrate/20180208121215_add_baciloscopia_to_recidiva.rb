class AddBaciloscopiaToRecidiva < ActiveRecord::Migration[5.1]
  def change
    add_column :recidivas, :baciloscopia_suspeita, :string
    add_column :recidivas, :baciloscopia_lb_suspeita, :string
  end
end
