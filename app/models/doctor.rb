class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :education




end
