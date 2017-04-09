class PatientCondition < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :icd10

  def self.search(search)
    where("icd10.code LIKE ? OR icd10.description LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.search(search)
    joins(:icd10).where('icd10s.code LIKE ? or icd10s.description LIKE ?', "%#{search}%", "%#{search}%")
  end

end
