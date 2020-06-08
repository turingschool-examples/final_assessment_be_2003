class Hospital < ApplicationRecord

  has_many :doctors

  def doctor_count
    doctors.count
  end

  def uniq_universities
    doctors.distinct.pluck(:education)
  end
  
  


end