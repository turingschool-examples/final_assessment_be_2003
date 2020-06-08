class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.order_patients_by_age
    orer(age: :desc)
  end
end
