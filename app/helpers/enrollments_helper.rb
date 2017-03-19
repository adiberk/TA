module EnrollmentsHelper
	
  def get_student_list(course)

  	enrolled = course.enrollments
	if enrolled.length == 0
	  return "Not registered for courses"
	end

	str = ""
	enrolled.each do |e|
	  if e.ta == false
	  	str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
	  end
	end
	  str.html_safe
  end

  def get_ta_list(course)

  	enrolled = course.enrollments
	if enrolled.length == 0
	  return "Not registered for courses"
	end

	str = ""
	enrolled.each do |e|
	  if e.ta == true
	  	str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
	  end
	end
	  str.html_safe
  end
end
