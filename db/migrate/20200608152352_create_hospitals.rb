class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.timestamps
    end
  end
end
