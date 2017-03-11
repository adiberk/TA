module UsersHelper
	def available_tas(user)
		courses = user.courses
		courses.each do |course|
			puts course.name
		end
		course_ids = []
		courses.each do |course|
			course_ids.push(course.id)
		end
		puts "***#{course_ids}"
		enrollments = [[]]
		course_ids.each do |id|
			enrollments.push(Enrollment.where(course_id: id, ta: true))
		end
		users = []
		enrollments.each do |enrol|
			enrol.each do |e|
				us = User.where(id: e.user_id, logged_in: true).take
				if us!= nil
					users.push(us)
				end
			end
		end
		users.each do |us|
			puts us.first_name
		end
	end
end
