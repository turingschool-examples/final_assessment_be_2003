class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
  
  def self.patients_by_age(order)
    select('doctors.*, patients.id, patients.name, patients.age')
    joins(:doctor_patients => :patient)
    pluck('patients.name')
    # order("patients.age '#{order}'")
  end 
end