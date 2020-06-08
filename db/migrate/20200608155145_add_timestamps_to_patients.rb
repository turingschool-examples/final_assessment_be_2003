class AddTimestampsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :created_at, :datetime, null: false
    add_column :patients, :updated_at, :datetime, null: false
  end
end
