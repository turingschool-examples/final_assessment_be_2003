class CreateHospital < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamp
    end
  end
end
