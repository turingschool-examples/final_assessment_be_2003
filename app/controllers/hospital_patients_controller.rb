class HospitalPatientsController < ApplicationController

    def index
        @hospital = Hospital.find(params[:id])
    end 
end 