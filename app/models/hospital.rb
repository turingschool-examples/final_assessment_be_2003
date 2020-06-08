class Hospital <ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def schools
    edu = []
    doctors.each do |doctor|
      edu << doctor.education
    end
    edu.uniq
  end


end
