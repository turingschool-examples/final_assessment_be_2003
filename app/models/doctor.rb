class Doctor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :education
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
  belongs_to :hospital
end
