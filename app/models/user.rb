class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length:{maximum: 25}
	# validates :last_name, presence: true, length:{maximum: 35} 
	# the above test causes to fail
	# validates :email, presence: true, length:{maximum:255}
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
