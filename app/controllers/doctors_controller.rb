class DoctorsController < ApplicationController
  def show
    @doctors = Doctor.find(params[:id])
  end

  def new
    @hospital_id = Hospital.find(params[:hospital_id])
  end
end
