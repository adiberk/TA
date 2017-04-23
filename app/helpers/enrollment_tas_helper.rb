module EnrollmentTasHelper

  def get_ta_list_from_enrollment_tas(enrollment_ta)
    ta_list = []
    enrollment_ta.each do |each_enroll_ta|
      ta_list.push(each_enroll_ta['user_id'])
    end
    return ta_list.uniq
  end
end
