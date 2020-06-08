class Doctor < ApplicationRecord
  belongs_to :hospital
  validates_presence_of :name, :specialty, :education
end
