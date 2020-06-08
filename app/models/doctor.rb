class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients


  def self.all_patients
    doc_pats = Doctor.joins(:doctor_patients)
                      .distinct
                      .pluck('patient_id')
    Patient.find(doc_pats)
  end
end
