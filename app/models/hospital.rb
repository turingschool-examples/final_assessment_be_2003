class Hospital < ApplicationRecord
  has_many :doctors

  def total_number_of_doctors
    doctors.count
  end
end
