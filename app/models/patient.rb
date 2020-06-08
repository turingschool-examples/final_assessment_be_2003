class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.sort_by_age
    order(age: :asc)
  end
end
