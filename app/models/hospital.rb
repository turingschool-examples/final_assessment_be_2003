class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def education_list
    doctors.select(:education).distinct.pluck(:education)
  end

  def show_patients
      names = []
      doctors.each do |doctor|
      doctor.patients.each do |patient|
        names << patient.name
      end
    end
    names
    binding.pry
  end

end
