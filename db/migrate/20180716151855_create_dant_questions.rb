class CreateDantQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :dant_questions do |t|
      t.integer :pergunta
      t.string :texto

      t.timestamps
    end
  end
end
