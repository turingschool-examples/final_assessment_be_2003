class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip

  has_many :doctors

  def list_universities
    self.doctors.pluck(:education).uniq
  end
end
