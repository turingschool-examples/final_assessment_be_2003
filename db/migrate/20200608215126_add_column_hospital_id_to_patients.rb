class AddColumnHospitalIdToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :hospital_id, :bigint
  end
end
