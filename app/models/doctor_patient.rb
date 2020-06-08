class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :education

  has_many :doctors
end
