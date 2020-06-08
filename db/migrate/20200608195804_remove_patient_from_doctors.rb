class RemovePatientFromDoctors < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :patient_id
  end
end
