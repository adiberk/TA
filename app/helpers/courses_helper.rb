module CoursesHelper
  def get_course_list()
	  my_courses = current_user().courses		
      if my_courses.length == 0
        return "Not registered for courses"
      end
    name = my_courses[0].name
    id = my_courses[0].id

    #str = "<li> <%= link_to 'name', :controller => 'courses', :action =>'show', :course_id=>'id', :course_name=>'name' %> </li>"
    str = "<li> test </li>"

	  count = 1
      while count < my_courses.length do

        name = my_courses[count].name
        id = my_courses[count].id

        #str += "<li> <%= link_to 'name', :controller => 'courses', :action =>'show', :course_id=>'id', :course_name=>'name' %> </li>"
        str += "<li> poop </li>"

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
