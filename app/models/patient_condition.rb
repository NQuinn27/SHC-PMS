class PatientCondition < ApplicationRecord
  belongs_to :patient
  belongs_to :condition
  belongs_to :doctor
end
