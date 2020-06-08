class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doc_patients
  has_many :patients, through: :doc_patients

  validates_presence_of :name,
                        :specialty,
                        :school,
                        :hospital_id
end
