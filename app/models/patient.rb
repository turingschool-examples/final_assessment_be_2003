class Patient < ApplicationRecord
  validates_presence_of :name, :age
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
end