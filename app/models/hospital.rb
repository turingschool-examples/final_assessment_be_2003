class Hospital <ApplicationRecord
  has_many :doctors

  def list_schools
    doctors.select(:education).map(&:education).uniq
  end
end
