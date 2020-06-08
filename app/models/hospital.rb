class Hospital < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  has_many :doctors

  def total_doctors
    doctors.length
  end

  def unique_schools
    schools = doctors.map do |doctor|
      doctor.education
    end
    schools.uniq
  end
end
