class Patient < ApplicationRecord
  validates_presence_of :name, :age
  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients

end