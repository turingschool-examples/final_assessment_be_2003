class AddDoctorToHospitals < ActiveRecord::Migration[5.1]
  def change
    add_reference :hospitals, :doctor, foreign_key: true
  end
end
