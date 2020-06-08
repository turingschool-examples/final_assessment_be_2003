class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
  validates_presence_of :name, :specialty, :education

  def self.all_universities
    select(:education).order(:education).distinct
  end

  def find_doctor_patient_id(patient_id)
    doctor_patients.where("patient_id = ?", patient_id)
                    .pluck("doctor_patients.id").first
  end
end
