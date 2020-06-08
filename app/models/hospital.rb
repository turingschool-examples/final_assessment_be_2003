class Hospital < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  has_many :doctors

  def total_doctors
    doctors.length
  end

  def unique_schools
    schools = doctors.map do |doctor|
      doctor.education
    end
    schools.uniq
  end

  def patients
    patients_list = []
    doctors.each do |doctor|
     doctor.patients.each do |patient|
      patients_list << patient
      end
    end
    patients_list.uniq.sort_by{|patient| -patient.age}
  end
  # def merchant_subtotal(merchant_id)
  #   order_items
  #     .joins("JOIN items ON order_items.item_id = items.id")
  #     .where("items.merchant_id = #{merchant_id}")
  #     .sum('order_items.price * order_items.quantity')
  # end
end
