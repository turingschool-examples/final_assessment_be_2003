class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patients, dependent: :destroy


  validates_presence_of :name,
                        :specialty,
                        :education
end
