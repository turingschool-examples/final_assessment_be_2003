class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    self.doctors.count
  end

  def doctor_universities
    self.doctors.pluck(:education).uniq
  end

  def patients_by_age
    Patient.joins(:doctor).where(:hospital_id == id).order(:age).reverse
  end
end
