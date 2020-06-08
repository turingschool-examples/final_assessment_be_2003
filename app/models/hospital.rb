class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def unique_doctor_educations
    doctors.pluck(:education).uniq
  end

  def all_patients_sorted_by_age
    # TODO: use AR for query 
    patients = doctors.map do |doctor|
      doctor.patients
    end.flatten

    patients.sort_by(&:age).reverse
  end
end