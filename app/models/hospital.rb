class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def affiliated_universities
    doctors.pluck(:education).uniq.join(", ")
  end

end
