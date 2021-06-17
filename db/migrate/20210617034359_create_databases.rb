class CreateDatabases < ActiveRecord::Migration[5.2]
  def change
    create_table :databases do |t|

      t.timestamps
    end
  end
end
