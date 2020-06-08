class DoctorsController <ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to "/doctors/#{@doctor.id}"
  end
end