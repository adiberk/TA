class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, :through => :enrollments

  has_many :enrollment_tas
  has_many :tacourses, :through => :enrollment_tas, :source => :course

  has_many :ta_appointments, :class_name => 'Appointment', :foreign_key => 'ta_id'
  has_many :student_appointments, :class_name => 'Appointment', :foreign_key => 'student_id'

  attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length:{maximum: 25}
	validates :last_name, presence: true
  validates :username, presence: true
	# the above test causes to fail
	# validates :email, presence: true, length:{maximum:255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end


end
