class HospitalDoctorsController < ApplicationController

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end 

  def create
    @hospital = Hospital.find(params[:hospital_id])
    doctor = @hospital.doctors.new(doctor_params)

    if doctor.save
      redirect_to hospital_path(@hospital) 
    else
      render :new
    end 
  end 

  #   def create
  #   @item = Item.find(params[:item_id])
  #   review = @item.reviews.new(review_params)
  #   if review.save
  #     redirect_to item_path(@item)
  #   else
  #     generate_flash(review)
  #     render :new
  #   end
  # end

  private

  def doctor_params
    params.permit(:name, :specialty, :education)
  end
end