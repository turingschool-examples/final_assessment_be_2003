class HospitalsController < ApplicationController
  def show
    @hospitals = Hospital.find(params[:id])
  end
end
