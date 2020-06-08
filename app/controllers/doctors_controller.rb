class DoctorsController <ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
  end
end