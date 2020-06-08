class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :education

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
