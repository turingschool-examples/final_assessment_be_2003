class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def doctor_universities
    doctors.select(:education).distinct.pluck(:education).to_sentence
  end

  def doctor_count
    doctors.count
  end 

  def patients
    doctor_patients.joins(:patient).select('patients.age').order('patients.age DESC').pluck('patients.name').uniq
  end

end
