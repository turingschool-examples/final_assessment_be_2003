class Hospital < ApplicationRecord
  has_many :doctors
  
  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end 
end