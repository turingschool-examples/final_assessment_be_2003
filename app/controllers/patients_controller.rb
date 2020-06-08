class PatientsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:hospital_id])
  end
end
