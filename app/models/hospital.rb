class Hospital < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :doctors

  def affiliated_universities
    Doctor.where("hospital_id = #{id}").pluck(:education).join(", ")
  end

end
