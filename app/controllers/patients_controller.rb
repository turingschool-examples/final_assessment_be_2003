class PatientsController < ApplicationController

  def index
    @hospital = Hospital.find_by(id: params[:hospital_id])
  end
  
end
