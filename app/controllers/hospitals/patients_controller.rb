class Hospitals::PatientsController <ApplicationController

  def index
    @patients = Hospital.find(params[:id]).all_patients_sorted_by_age
  end

end