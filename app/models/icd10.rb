class Icd10 < ApplicationRecord

  def self.search(search)
    where("code LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
    where("additional LIKE ?", "%#{search}%")
  end

end
