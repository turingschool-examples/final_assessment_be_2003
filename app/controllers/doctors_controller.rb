class DoctorsController <ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit_hospital
  end
end