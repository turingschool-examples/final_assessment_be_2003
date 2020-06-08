class Doctor < ApplicationRecord
  belongs_to :hospitals
  has_many :doc_patients
  has_many :patients, through: :doc_patients

  validates_presence_of :name,
                        :specialty,
                        :school,
                        :hospital_id
end
