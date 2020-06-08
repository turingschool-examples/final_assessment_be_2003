class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:hospital_id])
  end

  def index
    @hospital = Hospital.find(params[:hospital_id])
  end

end
