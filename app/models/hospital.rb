class Hospital < ApplicationRecord
  has_many :doctors
  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def count_of_doctors
    doctors.count
  end

  def patients
    doctors.joins(:patients)
            .select("patients.name AS name")
            .select("patients.age AS age")
            .order("age DESC").distinct
  end
end
