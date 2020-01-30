class Account < ApplicationRecord
  belongs_to :user

  has_secure_password

  validates :password, 
    confirmation: { case_sensitive: true },
    length: { minimum: 8, maximum: 32 }

end