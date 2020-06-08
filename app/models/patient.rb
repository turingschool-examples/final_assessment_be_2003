class Patient < ApplicationRecord
  validates_presence_of :name

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.order_by_oldest
    order(age: :desc).pluck(:name).uniq
  end
end