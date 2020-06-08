class Hospital < ApplicationRecord
  has_many :doctors

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def number_of_doctors
    doctors.count
  end

  def universities
    doctors.select('education').distinct.pluck('education')
  end

  def patient_list
    doctors.joins(:patients).select('patients.*').distinct.order('patients.age DESC')
  end


end
