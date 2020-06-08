class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
