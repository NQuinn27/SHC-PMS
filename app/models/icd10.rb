class Icd10 < ApplicationRecord

  def self.search(search)
    where("code LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

end
