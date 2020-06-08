class Hospital < ApplicationRecord
  has_many :doctors

  def total_number_of_doctors
    doctors.count
  end

  def unique_education
    doctors.distinct.pluck(:education)
  end

  def order_by_patients_age
    doctors.joins(:patients).order("patients.age desc").pluck("patients.name").uniq
  end
end
