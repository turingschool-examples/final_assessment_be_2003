class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def patient_list
    # binding.pry
  end
end