class Patient < ApplicationRecord 
  
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates_presence_of :name, :age

  def this_doctor_patient(doctor_id)
    doctor_patients.where(doctor_id: doctor_id).first
  end
  

end