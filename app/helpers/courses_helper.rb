module CoursesHelper
  def get_course_list()
	  my_courses = current_user().courses		
      if my_courses.length == 0
        return "Not registered for courses"
      end
	  str = "<li>#{my_courses[0].name}</li> "
	  count = 1
      while count < my_courses.length do
      	str+="<li>#{my_courses[count].name}</li>"
      	count+=1;
      end
      str.html_safe
  end





  def get_student_list(course)
    enrolled = course.enrollments
    if enrolled.length == 0
      return "Not registered for courses"     #keep return here?
    end

    str = ""
    enrolled.each do |e|
      str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
    end
    str.html_safe
  end

  def get_ta_list(course)
    enrolled = course.enrollment_tas
    if enrolled.length == 0
      return "Not registered for courses"     #keep return here?
    end

    str = ""
    enrolled.each do |e|
      str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
    end
    str.html_safe
  end

end
