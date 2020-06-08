class AddTimestampToDoctors < ActiveRecord::Migration[5.1]
  def change
    change_table(:doctors) { |t| t.timestamps}
  end
end
