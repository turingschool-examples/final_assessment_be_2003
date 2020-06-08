class PatientsController < ApplicationController

  def index
    @patients = Patient.all.order(age: :desc)
  end
  #need to come back and fix, need hospital specific patients only
end