class Hospital < ApplicationRecord
  has_many :doctors

  def doc_count
    doctors.count
  end

  def doc_universities
    doctors.select(:education).distinct.pluck(:education)
  end
  
  
end