class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.boolean :waiting?, default: false
    end
  end
end
