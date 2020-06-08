class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def order_by_patients_age
    patients.order(age: :desc)
  end
end
