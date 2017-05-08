
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
Officehour.delete_all
Review.delete_all
Appointment.delete_all
Conversation.delete_all

# create fake users
# 1st user
User.create!(first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar", confirmed_at:Time.now)
# 2nd user
User.create!(first_name: "Adi", last_name: "Berkowitz", username: "adi", email: "adi@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar",confirmed_at:Time.now)
# 3rd user
User.create!(first_name: "Hao", last_name: "Wang", username: "hao", email: "haowang@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar",confirmed_at:Time.now)
# 4th user
User.create!(first_name: "Stacy", last_name: "Dean", username: "stacy", email: "stacydean@tuffs.edu", university_id: 2, password:"foobar", password_confirmation: "foobar",confirmed_at:Time.now)
# 5th user
User.create!(first_name: "Fanny", last_name: "Ferguson", username: "fanny", email: "fannyferguson@bc.edu", university_id: 3, password:"foobar", password_confirmation: "foobar",confirmed_at:Time.now)

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
  	User.create!(first_name:each_fname, last_name:each_lname, username:each_username, email:each_email, university_id:each_uni_id, password:"foobar", password_confirmation: "foobar", confirmed_at:Time.now)
	each_id += 1
  index += 1
end

list = User.all

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
Major.create!(id:1, university_id:1, name:"Computer Science")
Major.create!(id:2, university_id:1, name:"Economics")
Major.create!(id:3, university_id:1, name:"Mathmatic")


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
	course_split = course.split(" ")
	abrv = ""
	if course_split.length <= 1
		abrv = course_split[0][0] + course_split[0][1]
	else
		course_split.each do |name|
			abrv+= name[0]
		end
	end
	Course.create!(id: count, name: course, major_id: major_id, abbrev: abrv, description: Faker::Lorem.paragraph(6, true), teacher: Faker::Name.name)	#teacher: arr2[count],
	count+=1
end
# total of courses : 14 courses


# create fake enrollments

Enrollment.create!(id: 1, user_id: list[0].id, course_id:1)
Enrollment.create!(id: 2, user_id: list[0].id, course_id:2)
Enrollment.create!(id: 5, user_id: list[1].id, course_id: 3)
Enrollment.create!(id: 22, user_id: list[1].id, course_id: 4)
Enrollment.create!(id: 3, user_id: list[2].id, course_id: 4)
Enrollment.create!(id: 4, user_id: list[4].id, course_id: 2)
Enrollment.create!(id: 6, user_id:list[4].id, course_id:1)
Enrollment.create!(id: 7, user_id:list[4].id, course_id:5)

# 2nd version of enrollments create by hao
Enrollment.create!(id:8, user_id:list[5].id, course_id:12)
Enrollment.create!(id:9, user_id:list[5].id, course_id:7)
Enrollment.create!(id:10, user_id:list[5].id, course_id:5)
#
Enrollment.create!(id:11, user_id:list[6].id, course_id:3)
Enrollment.create!(id:12, user_id:list[6].id, course_id:8)
Enrollment.create!(id:13, user_id:list[6].id, course_id:11)
#
Enrollment.create!(id:14, user_id:list[7].id, course_id:4)
Enrollment.create!(id:15, user_id:list[7].id, course_id:13)
Enrollment.create!(id:16, user_id:list[7].id, course_id:6)
#
Enrollment.create!(id:17, user_id:list[8].id, course_id:2)
Enrollment.create!(id:18, user_id:list[8].id, course_id:4)
Enrollment.create!(id:19, user_id:list[8].id, course_id:2)
#
Enrollment.create!(id:20, user_id:list[9].id, course_id:4)
Enrollment.create!(id:21, user_id:list[15].id, course_id:7)
# create fake enrollment_tas

EnrollmentTa.create!(id:1, user_id: list[1].id, course_id:1)
EnrollmentTa.create!(id:2, user_id: list[2].id, course_id:1)
EnrollmentTa.create!(id:3, user_id: list[1].id, course_id: 2)
EnrollmentTa.create!(id:4, user_id:list[0].id, course_id:4)
EnrollmentTa.create!(id:5, user_id:list[0].id, course_id:5)
EnrollmentTa.create!(id:20, user_id:list[3].id, course_id:3)
EnrollmentTa.create!(id:21, user_id:list[4].id, course_id:4)
# 2nd version of enrollment_tas
EnrollmentTa.create!(id:6, user_id:list[5].id, course_id:13)
EnrollmentTa.create!(id:7, user_id:list[5].id, course_id:8)
EnrollmentTa.create!(id:8, user_id:list[5].id, course_id:1)
EnrollmentTa.create!(id:9, user_id:list[5].id, course_id:2)
#
EnrollmentTa.create!(id:10, user_id:list[6].id, course_id:4)
EnrollmentTa.create!(id:11, user_id:list[6].id, course_id:12)
#
EnrollmentTa.create!(id:12, user_id:list[7].id, course_id:9)
EnrollmentTa.create!(id:13, user_id:list[7].id, course_id:7)
EnrollmentTa.create!(id:14, user_id:list[7].id, course_id:3)
#
EnrollmentTa.create!(id:15, user_id:list[8].id, course_id:11)
EnrollmentTa.create!(id:16, user_id:list[8].id, course_id:10)
EnrollmentTa.create!(id:17, user_id:list[8].id, course_id:7)
#
EnrollmentTa.create!(id:18, user_id:list[9].id, course_id:7)
EnrollmentTa.create!(id:19, user_id:list[9].id, course_id:10)



Officehour.create!(ta_id: list[0].id, course_id: 4, start:"Mon, 3 Apr 2017 08:30:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[0].id, course_id: 4, start:"Wed, 5 Apr 2017 10:30:00 AM", end:Time.now, online: true)
Officehour.create!(ta_id: list[0].id, course_id: 5, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[0].id, course_id: 5, start:"Fri, 7 Apr 2017 04:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[1].id, course_id: 2, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false )
Officehour.create!(ta_id: list[1].id, course_id: 2, start:"Mon, 3 Apr 2017 12:30:00 PM", end:Time.now, online: true)
Officehour.create!(ta_id: list[1].id, course_id: 2, start:"Wed, 5 Apr 2017 03:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[5].id, course_id: 2, start:"Tue, 4 Apr 2017 02:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[5].id, course_id: 2, start:"Wed, 5 Apr 2017 01:30:00 PM", end:Time.now, online: true)
Officehour.create!(ta_id: list[5].id, course_id: 2, start:"Wed, 5 Apr 2017 10:30:00 AM", end:Time.now, online: true)
Officehour.create!(ta_id: list[1].id, course_id: 1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[1].id, course_id: 1, start:"Son, 2 Apr 2017 12:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[1].id, course_id: 1, start:"Fri, 7 Apr 2017 09:30:00 AM", end:Time.now, online: true)
Officehour.create!(ta_id: list[2].id, course_id: 1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: true)
Officehour.create!(ta_id: list[2].id, course_id: 1, start:"Thu, 6 Apr 2017 10:30:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[2].id, course_id: 1, start:"Wed, 5 Apr 2017 12:00:00 PM", end:Time.now, online: true)
Officehour.create!(ta_id: list[3].id, course_id: 3, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[3].id, course_id: 3, start:"Wed, 5 Apr 2017 12:00:00 PM", end:Time.now, online: true)
Officehour.create!(ta_id: list[3].id, course_id: 3, start:"Tue, 3 Apr 2017 01:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: list[7].id, course_id: 3, start:"Mon, 3 Apr 2017 09:30:00 AM", end:Time.now, online: true)
Officehour.create!(ta_id: list[7].id, course_id: 3, start:"Tue, 4 Apr 2017 11:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[4].id, course_id: 4, start:"Wed, 5 Apr 2017 12:00:00 PM", end:Time.now, online: true)
Officehour.create!(ta_id: list[4].id, course_id: 4, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: list[4].id, course_id: 4, start:"Tue, 4 Apr 2017 01:00:00 AM", end:Time.now, online: false)

Appointment.create!(ta_id: list[1].id, student_id:list[4].id, course_id: 1, start:DateTime.parse(DateTime.now.strftime("%Y-%m-%dT08:30:00%z")),  end: Faker::Date.forward, confirmed: false)
Appointment.create!(ta_id: list[2].id, student_id:list[0].id, course_id: 1, start:DateTime.now.change({ day: Time.now.day+1, hour: 10, min: 30, sec: 0 }), end: Faker::Date.forward, confirmed: false)
Appointment.create!(ta_id: list[7].id, student_id:list[1].id, course_id: 3, start:DateTime.now.change({ day: Time.now.day+2, hour: 13, min: 0, sec: 0 }), end: Faker::Date.forward, confirmed: true)
Appointment.create!(ta_id: list[7].id, student_id:list[1].id, course_id: 3, start:DateTime.now.change({ day: Time.now.day+1, hour: 16, min: 30, sec: 0 }), end: Faker::Date.forward, confirmed: true)

Review.create!(ta_id: list[1].id, student_id:list[0].id, course_id: 2, review: "3 am happy with 1", score: 3)
Review.create!(ta_id: list[0].id, student_id:list[4].id, course_id: 5, review: "2 am happy with 1", score: 4)
Review.create!(ta_id: list[0].id, student_id:list[2].id, course_id: 4, review: "4 am happy with 1", score: 5)
# Review.create!(ta_id:3, student_id:1, course_id:1, review:"eh", score:3.5)

Conversation.create!(recipient_id: list[0].id, sender_id: list[1].id, created_at: Time.now, updated_at: Time.now)

