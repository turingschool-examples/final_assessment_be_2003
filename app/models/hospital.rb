class Hospital < ApplicationRecord
  has_many :doctors
  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip


  # def age_sorted_patient_names
  #   patients = []
  #   doctors.each do |doctor|
  #     patients << doctor.patients
  #   end
  #   patients.flatten!
  #   patients = patients.sort_by { |patient| patient.age}.reverse
  #   patients.map { |patient| patient.name }.uniq
  # end

  def age_sorted_patient_names
    patient_ids = []
    doctors.each do |doctor|
      patient_ids << doctor.patient_ids
    end
    patient_ids.flatten!
    Patient.where(id: patient_ids).order(age: :DESC).pluck(:name)
  end

end
