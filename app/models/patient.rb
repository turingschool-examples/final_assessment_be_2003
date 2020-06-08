class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  def self.sort_by_age(hospital_id, order)
    Patient.joins(:doctor_patients => :doctor)
           .where("doctors.hospital_id = #{hospital_id}")
           .order("patients.age #{order}")
  end 
end