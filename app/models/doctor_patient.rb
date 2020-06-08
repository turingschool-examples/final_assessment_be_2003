class DoctorPatient < ApplicationRecord 
  
  belongs_to :doctor
  belongs_to :patient

  def this_doctor_patient
    
  end
  

end