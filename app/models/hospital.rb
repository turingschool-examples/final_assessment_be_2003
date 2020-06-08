class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors


  def uniq_education
    doctors.select('education')
           .distinct
           .pluck('education')
  end

  # def ordered_names
  #   doctors.each do |doctor|
  #     doctor.patients.order(:age)
  #   end
  #         #.joins(:patients)
  #         # .select('patients.name')
  #         # .group('patients.name')
  #         # .order(doctors.patients.age "ASC")
  #         # .pluck('patients.name') 
  # end
end