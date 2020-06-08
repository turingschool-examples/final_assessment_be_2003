class CreateTest < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :name
    end
  end
end
