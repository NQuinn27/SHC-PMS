class Patient < ApplicationRecord
  has_many :patient_conditions
end
