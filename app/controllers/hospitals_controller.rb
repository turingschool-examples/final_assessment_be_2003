class HospitalsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:id])
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

end
