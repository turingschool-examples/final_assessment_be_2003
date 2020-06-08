class AddHospitalToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_reference :doctors, :hospital, foreign_key: true
  end
end
