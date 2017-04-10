class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  # validates :user_id, :uniqueness: {is_ta?}
  # validates_presence_of :user_id, :unless => lambda {is_ta? == false}
  validate :is_ta

  def is_ta
  	if (EnrollmentTa.find_by(user_id: self.user_id, course_id: self.course_id) != nil)
  		errors.add(:base, 'Can not be a TA and take the course')
  	end
  end
end
