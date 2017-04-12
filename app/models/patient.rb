class Patient < ApplicationRecord
  has_many :patient_conditions, dependent: :nullify

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
