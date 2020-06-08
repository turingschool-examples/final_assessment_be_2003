class PatientsController <ApplicationController

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to "/doctors/#{doctor_params[:doctor_id]}"
  end

  private

  def doctor_params
    params.permit(:doctor_id)
  end

end