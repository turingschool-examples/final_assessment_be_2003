class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_universities
    doctors.select(:education).distinct.pluck(:education).to_sentence
  end
end
