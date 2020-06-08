class ChangePatientsToBePatientInDoctorPatients < ActiveRecord::Migration[5.1]
  def change
    rename_column :doctor_patients, :patients_id, :patient_id
  end
end
