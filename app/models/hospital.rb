class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors

  def doctor_universities
    doctors.select(:education).distinct.pluck(:education).to_sentence
  end

  def patients
    doctor_patients.joins(:patient).select('patients.age').order('patients.age').pluck('patients.name').uniq.join(", ")
  end

end
