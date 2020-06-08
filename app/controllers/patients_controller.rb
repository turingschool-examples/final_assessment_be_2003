class PatientsController <ApplicationController

  # TODO: strong params for doctor id
  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

end