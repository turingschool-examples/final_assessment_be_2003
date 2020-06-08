class Hospital < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  has_many :doctors

  def number_of_doctors
    doctors.length
  end

  def unique_schools
    doctors.pluck(:education).uniq
  end

  def doctor_patients
    Patient.joins(:doctor_patients).joins(:doctors).where('doctors.hospital_id = ?',self.id).order(:age)
  end
end
