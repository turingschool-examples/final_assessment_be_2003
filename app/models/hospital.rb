class Hospital < ApplicationRecord
  has_many :doctors

  def num_doctors
    doctors.count
  end
end
