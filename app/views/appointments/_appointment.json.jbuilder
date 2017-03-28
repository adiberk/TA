json.extract! appointment, :id, :course_id, :student_id, :ta_id, :start, :end, :confirmed, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
