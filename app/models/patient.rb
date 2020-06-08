class Patient <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

end
