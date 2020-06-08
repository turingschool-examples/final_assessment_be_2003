class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def number_of_doctors
    doctors.length
  end
end