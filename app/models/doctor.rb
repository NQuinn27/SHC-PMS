class Doctor < ApplicationRecord
  belongs_to :user

  attr_accessor :user_email
  attr_accessor :user_password
  attr_accessor :user_password_confirmation

  def self.search(search)
    where("code LIKE ? OR description LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
