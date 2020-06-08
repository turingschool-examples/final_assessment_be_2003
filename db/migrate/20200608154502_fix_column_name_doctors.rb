class FixColumnNameDoctors < ActiveRecord::Migration[5.1]
  def change
    rename_column :doctors, :university, :education
  end
end
