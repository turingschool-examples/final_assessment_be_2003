class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  def num_doctors
    doctors.count
  end

  def unique_univ
    doctors.select(:education).distinct.pluck(:education).join(', ')
  end

  def patients_by_age
    patients.distinct.order(age: :desc)
  end
end
