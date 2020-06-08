class Doctor < ApplicationRecord
    
    validates_presence_of :name,
                          :specialty,
                          :education

    belongs_to :hospital
    has_many :doctor_patients
    has_many :patients, through: :doctor_patients
end