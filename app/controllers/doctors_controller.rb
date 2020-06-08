class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @hospital = Hospital.find_by(id: params[:hospital_id])
  end

  def create
  end
end
