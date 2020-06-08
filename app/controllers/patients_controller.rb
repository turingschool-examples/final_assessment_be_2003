class PatientsController < ApplicationController

  def index
    @hospital = Hospital.find(params[:id])

  end
end