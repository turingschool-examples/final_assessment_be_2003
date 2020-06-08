class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  validates_presence_of  :name,
                        :specialty,
                        :university

  def self.unique_universities
    select(:university).distinct.pluck(:university)
  end
end
