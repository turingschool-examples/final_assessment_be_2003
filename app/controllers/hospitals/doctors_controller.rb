class Hospitals::DoctorsController <ApplicationController

  def new
    @hospital = Hospital.find(params[:id])
    # @doctor = Doctor.new
  end

  def create
    # hospital_id = hospital_id: params[:id]
    @hospital = Hospital.find(params[:id])
    @doctor = @hospital.doctors.create(doctor_params)
    redirect_to "/hospitals/#{@hospital.id}"
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end