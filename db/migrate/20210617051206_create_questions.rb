class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.String :text
      t.String :description
      t.String :explaination
      t.String :category
      t.String :difficulty

      t.timestamps
    end
  end
end
