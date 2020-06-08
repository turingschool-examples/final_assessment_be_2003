class DoctorsController < ApplicationController
  def show
    @doc = Doctor.find(params[:id])
  end

  def new
  end
end
