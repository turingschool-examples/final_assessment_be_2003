class Doctor < ApplicationRecord 
  validates_presence_of :name, :specialty, :education
end