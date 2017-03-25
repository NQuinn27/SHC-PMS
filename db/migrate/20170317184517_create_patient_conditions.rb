class CreatePatientConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_conditions do |t|
      t.references :patient, foreign_key: true
      t.references :condition, foreign_key: true
      t.date :date_reported
      t.date :date_cured
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
