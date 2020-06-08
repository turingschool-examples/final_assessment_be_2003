class AddTimeStampToPatients < ActiveRecord::Migration[5.1]
  def change
    change_table(:patients) { |t| t.timestamps}
  end
end
