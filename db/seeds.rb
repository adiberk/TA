# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Course.delete_all
University.delete_all
Major.delete_all
Enrollment.delete_all
EnrollmentTa.delete_all
# create fake users
# 1st user
User.create(id: 1, first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 2nd user
User.create(id: 2, first_name: "Adi", last_name: "Berkowitz", username: "adi", email: "adi@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 3rd user
User.create(id: 3, first_name: "Hao", last_name: "Wang", username: "hao", email: "haowang@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 4th user
User.create(id: 4, first_name: "Stacy", last_name: "Dean", username: "stacy", email: "stacydean@tuffs.edu", university_id: 2, password:"foobar", password_confirmation: "foobar")
# 5th user
User.create(id: 5, first_name: "Fanny", last_name: "Ferguson", username: "fanny", email: "fannyferguson@bc.edu", university_id: 3, password:"foobar", password_confirmation: "foobar")

# second version of user seed from ID:6
# seed names from name.txt
# fake name is created by http://listofrandomnames.com/
index = 1
each_id = 6
prng= Random.new
File.open("#{Rails.root}/db/name.txt").each do |line|
  split_list = line.split
  each_fname = split_list[0]
  each_lname = split_list[1]
  each_username = each_fname.downcase+each_lname.downcase
  each_email = each_username+"@brandeis.edu"
  if index > 10
    each_uni_id = prng.rand(1..5)
  else
    each_uni_id = 1
  end
	User.create(id:each_id, first_name:each_fname, last_name:each_lname, username:each_username, email:each_email, university_id:each_uni_id, password:"foobar", password_confirmation: "foobar")
	each_id += 1
  index += 1
end
# total of user: 25

# seed university by Hao
university_ls = ["Brandeis Univeristy", "Boston University", "Boston College" , "Northeastern University", "Harvard University"]
index = 1
university_ls.each do |each_uni|
	University.create(id:index, name:each_uni)
	index += 1
end
# total of university: 5

# create fake major
Major.create(id:1, university_id:1, name:"Computer Science")
Major.create(id:2, university_id:1, name:"Economics")
Major.create(id:3, university_id:1, name:"Mathmatic")


# create fake courses
# the first version is from capstone to Algebra by Adi
# the second version is from discrete to matlab by Hao
arr = ["Capstone Project", "Data Structure", "Mobile App", "Macroeconomics", "Algebra", "Discrete Math", "Linear Algebra", "Calculus", "Network Information Systems", "Operating Systems", "Database Management", "Algorithm", "Information Retrieval", "Scientific Data Processing in Matlab" ]
# arr2 = ["Pito Salas", "	Antonella Di Lillo", "James Storer", "	Melissa Nemon", "Frank Lowenstein"]
count = 1
major_id = 1
arr.each do |course|
	if count ==4
		major_id = 2
	elsif count == 5 or count == 6 or count == 7 or count == 8
		major_id = 3
	else
		major_id = 1
	end
	Course.create(id: count, name: course, major_id: major_id)	#teacher: arr2[count],
	count+=1
end
# total of courses : 14 courses


# create fake enrollments

Enrollment.create!(id: 1, user_id: 1, course_id:1)
Enrollment.create!(id: 2, user_id: 1, course_id:2)
Enrollment.create!(id: 5, user_id: 2, course_id: 3)
Enrollment.create!(id: 3, user_id: 3, course_id: 4)
Enrollment.create!(id: 4, user_id: 3, course_id: 2)
Enrollment.create!(id: 6, user_id:5, course_id:1)
Enrollment.create!(id: 7, user_id:5, course_id:5)

# 2nd version of enrollments create by hao
Enrollment.create!(id:8, user_id:6, course_id:12)
Enrollment.create!(id:9, user_id:6, course_id:7)
Enrollment.create!(id:10, user_id:6, course_id:5)
#
Enrollment.create!(id:11, user_id:7, course_id:3)
Enrollment.create!(id:12, user_id:7, course_id:8)
Enrollment.create!(id:13, user_id:7, course_id:11)
#
Enrollment.create!(id:14, user_id:8, course_id:4)
Enrollment.create!(id:15, user_id:8, course_id:13)
Enrollment.create!(id:16, user_id:8, course_id:6)
#
Enrollment.create!(id:17, user_id:9, course_id:2)
Enrollment.create!(id:18, user_id:9, course_id:4)
Enrollment.create!(id:19, user_id:9, course_id:2)
#
Enrollment.create!(id:20, user_id:10, course_id:4)

# create fake enrollment_tas

EnrollmentTa.create!(id:1, user_id: 2, course_id:1)
EnrollmentTa.create!(id:2, user_id: 3, course_id:1)
EnrollmentTa.create!(id:3, user_id: 2, course_id: 2)
EnrollmentTa.create!(id:4, user_id:1, course_id:4)
EnrollmentTa.create!(id:5, user_id:1, course_id:5)

# 2nd version of enrollment_tas
EnrollmentTa.create!(id:6, user_id:6, course_id:13)
EnrollmentTa.create!(id:7, user_id:6, course_id:8)
EnrollmentTa.create!(id:8, user_id:6, course_id:1)
#
EnrollmentTa.create!(id:9, user_id:7, course_id:4)
EnrollmentTa.create!(id:10, user_id:7, course_id:12)
#
EnrollmentTa.create!(id:12, user_id:8, course_id:9)
EnrollmentTa.create!(id:13, user_id:8, course_id:7)
EnrollmentTa.create!(id:14, user_id:8, course_id:3)
#
EnrollmentTa.create!(id:15, user_id:9, course_id:11)
EnrollmentTa.create!(id:16, user_id:9, course_id:10)
EnrollmentTa.create!(id:17, user_id:9, course_id:7)
#
EnrollmentTa.create!(id:19, user_id:10, course_id:7)
EnrollmentTa.create!(id:20, user_id:10, course_id:10)




Officehour.create!(ta_id: 1, course_id: 4, start:"Mon, 3 Apr 2017 08:30:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: 3, course_id: 1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Mon, 3 Apr 2017 12:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Wed, 5 Apr 2017 03:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 1, course_id: 5, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false )
Officehour.create!(ta_id:2, course_id:1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)

Appointment.create!(ta_id: 2, student_id:5, course_id: 1, start:Time.now, end: Faker::Date.forward, confirmed: false)
Appointment.create!(ta_id: 1, student_id:3, course_id: 4, start: "Wed, 5 Apr 2017 01:30:00 PM", end: Faker::Date.forward, confirmed: true)
Appointment.create!(ta_id: 3, student_id:1, course_id: 1, start:Time.now, end: Faker::Date.forward, confirmed: false)


Review.create!(ta_id: 2, student_id:3, course_id: 2, review: "3 am happy with 1", score: 3)
Review.create!(ta_id: 1, student_id:5, course_id: 5, review: "2 am happy with 1", score: 4)
Review.create!(ta_id: 1, student_id:3, course_id: 4, review: "4 am happy with 1", score: 5)
# Review.create!(ta_id:3, student_id:1, course_id:1, review:"eh", score:3.5)
