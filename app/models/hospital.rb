class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    self.doctors.count
  end

  def doctor_universities
    self.doctors.pluck(:education).uniq
  end
end
