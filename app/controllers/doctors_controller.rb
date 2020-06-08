class DoctorsController <ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    require 'pry'; binding.pry
  end

end