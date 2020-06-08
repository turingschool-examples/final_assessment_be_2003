class Doctor < ApplicationRecord 
  validates_presence_of :name, :specialty, :education
  belongs_to :hospital
end