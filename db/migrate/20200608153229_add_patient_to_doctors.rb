class AddPatientToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_reference :doctors, :patient, foreign_key: true
  end
end
