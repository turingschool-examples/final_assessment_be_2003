class Hospital < ApplicationRecord 
    validates_presence_of :name,
                          :address,
                          :city,
                          :state,
                          :zip

    has_many :doctors

    def doctor_schools
        doctors.select(:education).distinct.pluck(:education)
    end

    def all_patients_by_age 
        Patient.joins(:doctors).where('hospital_id = ?', self.id).order(age: :desc)
    end
end
