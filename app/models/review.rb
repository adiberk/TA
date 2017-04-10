class Review < ApplicationRecord

  belongs_to :ta, :class_name => "User"
  belongs_to :student, :class_name => "User"

  validate :must_have_ta
  def must_have_ta
  	student_enrollments = Enrollment.where(course_id:self.course_id, user_id: self.student_id)
  	ta_enrollments = EnrollmentTa.where(course_id:self.course_id, user_id:self.ta_id)
  	if (ta_enrollments.length == 0 || student_enrollments.length == 0)
  		errors.add(:base, 'Can not write review because not enrolled in any courses with this TA')
  	end

  end
end
