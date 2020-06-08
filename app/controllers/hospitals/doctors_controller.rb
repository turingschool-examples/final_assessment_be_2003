class Hospitals::DoctorsController <ApplicationController

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    @hospital = Hospital.find(params[:id])
    @doctor = @hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{@hospital.id}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end