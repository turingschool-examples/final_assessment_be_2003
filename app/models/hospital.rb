class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors


  def uniq_education
    doctors.select('education')
           .distinct
           .pluck('education')
  end
end