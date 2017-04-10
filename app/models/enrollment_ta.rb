class EnrollmentTa < ApplicationRecord
	belongs_to :user
	belongs_to :course
	validate :is_student

	def is_student
		if (Enrollment.find_by(user_id: self.user_id, course_id: self.course_id) != nil)
			errors.add(:base, 'Can not be a student and TA of the course')
		end
	end
end
