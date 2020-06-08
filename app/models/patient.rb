class Patient < ApplicationRecord
  has_many :doc_patients
  has_many :doctors, through: :doc_patients

  validates_presence_of :name,
                        :age,
                        :waiting?
end
