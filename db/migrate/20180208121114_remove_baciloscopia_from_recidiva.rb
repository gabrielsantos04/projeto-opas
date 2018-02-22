class RemoveBaciloscopiaFromRecidiva < ActiveRecord::Migration[5.1]
  def change
    remove_column :recidivas, :baciloscopia_alta, :string
    remove_column :recidivas, :baciloscopia_lb_alta, :string
  end
end
