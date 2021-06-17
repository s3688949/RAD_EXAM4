class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.string :time
      t.integer :correct
      t.string :difficulty
      t.string :category

      t.timestamps
    end
  end
end
