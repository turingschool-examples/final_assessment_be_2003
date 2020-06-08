class Hospital < ApplicationRecord
  validates_presence_of :address, :city, :state, :zip

  has_many :doctors
end
