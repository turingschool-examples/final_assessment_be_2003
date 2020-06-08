class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def education_list
    doctors.select(:education).distinct.pluck(:education)
  end

  def show_patients
    Patient.joins(:doctors).where(doctors: {hospital_id: id}).order(age: :desc).pluck(:name)
  end

end
