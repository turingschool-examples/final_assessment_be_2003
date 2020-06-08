class AddTimestampToHospitals < ActiveRecord::Migration[5.1]
  def change
    change_table(:hospitals) { |t| t.timestamps}
  end
end
