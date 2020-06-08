class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def number_of_doctors
    doctors.length
  end

  def doctor_alma_maters
    doctors.pluck("doctors.education").uniq
  end

  def patients_by_age
    doctors.joins(:patients).order("patients.age DESC").pluck("patients.name").uniq
  end
end