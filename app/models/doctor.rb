class Doctor < ApplicationRecord 
  validates_presence_of :name, :specialty, :education
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def ordered_names
    patients.order(:age)
  end

  # def remove_patient(patient_id)
  #   binding.pry
  #   @patients[patient_id] -= 1
  # end
end