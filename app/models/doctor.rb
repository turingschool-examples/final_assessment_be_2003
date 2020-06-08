class Doctor <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :education
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.unique_education
    schools = pluck(:education).uniq
    schools.join(", ")
  end

end
