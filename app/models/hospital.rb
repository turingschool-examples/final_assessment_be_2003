class Hospital < ApplicationRecord
  has_many :doctors
  
  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end 

  def count_of_doctors
    doctors.count
  end 
end