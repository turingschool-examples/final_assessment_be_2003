class Hospital < ApplicationRecord

  has_many :doctors

  validates_presence_of :name, 
                        :address, 
                        :city, 
                        :state, 
                        :zip

  def doctor_count
    doctors.count
  end

  def uniq_education
    doctors.distinct
            .pluck(:education)
            .join(", ")
  end
 
  def patients_by_age
    doctors.joins(:patients)
            .order('patients.age DESC')
            .pluck('patients.name')
  end
  
  


end