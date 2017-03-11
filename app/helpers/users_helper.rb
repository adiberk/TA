module UsersHelper
	def available_tas()
		courses = current_user.courses
		courses.each do |course|
			puts course.name
		end
		course_ids = []
		courses.each do |course|
			course_ids.push(course.id)
		end
		# puts "***#{course_ids}"
		enrollments = [[]]
		course_ids.each do |id|
			enrollments.push(Enrollment.where(course_id: id, ta: true))
		end
		users = []
		string = ""
		enrollments.each do |enrol|
			enrol.each do |e|
				us = User.where(id: e.user_id, logged_in: true).take
				if us!= nil and !users.include? us and us!=current_user
					users.push(us)
					string+= "<dt>#{Course.find(e.course_id).name} </dt>"
					string +="<dd><a href='#'>#{us.first_name} #{us.last_name}</a></dd>"
					string += "<br></br>"
				end
			end
		end
		# users.each do |us|
		# 	puts us.first_name
		# end
		users = users.uniq
		return string.html_safe
	end

	# def display_active_TA()
	# 	tas = available_tas
	# 	string = ""
	# 	tas.each do |ta|
	# 		enrollments_user = current_user.enrollments

	# 		string += "<dt> </dt>"
	# 		string +="<dd><a href='#'> Nick April </a></dd>"
	# 	end
	# end
end
