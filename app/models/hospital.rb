class Hospital < ApplicationRecord

  has_many :doctors

  def doctor_count
    doctors.count
  end

  def uniq_universities
    doctors.distinct.pluck(:education)
  end
 
  def patients_by_age
    doctors.joins(:patients)
            .order('patients.age')
            .pluck('patients.name')
  end
  
  


end