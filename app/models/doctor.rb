class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
  validates_presence_of :name, :specialty, :education

  def self.all_universities
    select(:education).order(:education).distinct
  end
end
