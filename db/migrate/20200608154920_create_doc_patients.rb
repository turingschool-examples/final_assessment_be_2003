class CreateDocPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :doc_patients do |t|
      t.bigint :doctor_id
      t.bigint :patient_id
    end
  end
end
