class HospitalDoctorsController < ApplicationController
  def new
    @hospital = Hospital.find(params[:id])
  end
end
