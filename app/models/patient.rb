class Patient < ApplicationRecord
  has_many :patient_conditions

  def self.search(search)
    where("first_name LIKE ?", "%#{search}%")
    where("last_name LIKE ?", "%#{search}%")
  end

end
