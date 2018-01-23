class AddCategoriaToQueixas < ActiveRecord::Migration[5.1]
  def change
    add_reference :queixas, :categoria_queixa, foreign_key: true
  end
end
