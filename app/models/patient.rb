class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  def self.sort_by_age(order)
    order(age: "#{order}")
  end 
end