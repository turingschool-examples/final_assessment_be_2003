class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def education_list
    doctors.select(:education).distinct.pluck(:education)
  end
end
