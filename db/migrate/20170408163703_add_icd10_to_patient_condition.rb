class AddIcd10ToPatientCondition < ActiveRecord::Migration[5.1]
  def change
    add_reference :patient_conditions, :icd10, foreign_key: true
  end
end
