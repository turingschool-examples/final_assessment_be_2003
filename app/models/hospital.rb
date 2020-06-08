class Hospital <ApplicationRecord
  has_many :doctors

  def list_schools
    doctors.select(:education).map(&:education).uniq
  end

  def sort_patients_by_age
  require "pry"; binding.pry
  end
end
