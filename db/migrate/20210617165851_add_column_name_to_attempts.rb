class AddColumnNameToAttempts < ActiveRecord::Migration[5.2]
  def change
    add_column :attempts, :history_id, :integer
  end
end
