class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.integer :history_id
      t.string :time
      t.integer :correct
      t.integer :questions
      t.string :difficulty
      t.string :category

      t.timestamps
    end
  end
end
