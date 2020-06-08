class DropTableTests < ActiveRecord::Migration[5.1]
  def change
    drop_table :tests
  end
end
