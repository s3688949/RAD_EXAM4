class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :questionString
      t.string :description
      t.string :explaination
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
