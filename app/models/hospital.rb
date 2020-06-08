class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  # def order_by_oldest
  #   x = DoctorPatient.where(doctor_id: self.doctors)
  #   binding.pry
  # end
end