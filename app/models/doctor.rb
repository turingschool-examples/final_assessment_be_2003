class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients, dependent: :destroy
  has_many :patients, through: :doctor_patients


  validates_presence_of :name,
                        :specialty,
                        :education
end
