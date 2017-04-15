class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :enrollments
  has_many :courses, :through => :enrollments

  has_many :enrollment_tas
  has_many :tacourses, :through => :enrollment_tas, :source => :course

  has_many :ta_appointments, :class_name => 'Appointment', :foreign_key => 'ta_id'
  has_many :student_appointments, :class_name => 'Appointment', :foreign_key => 'student_id'

  has_many :officehours, :foreign_key => 'ta_id'

  has_many :student_reviews, :class_name => 'Review', :foreign_key => 'student_id'
  has_many :ta_reviews, :class_name => 'Review', :foreign_key => 'ta_id'

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy


end
