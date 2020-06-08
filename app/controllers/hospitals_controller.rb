class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
  end

  def index
    @hospital = Hospital.find(params[:id])
  end

end
