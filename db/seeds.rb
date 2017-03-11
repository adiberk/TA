# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Course.delete_all
Enrollment.delete_all
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
# create fake courses
# 1st course
Course.create(id: 1, name: "Capstone Project", major_id:1)
# 2nd course
Course.create(id: 2, name: "Data Structure", major_id:1)
# 3rd course
Course.create(id: 3, name: "Mobile App", major_id:1)
# 4th course
Course.create(id: 4, name: "Macroeconomics", major_id:2)
# 5th course
Course.create(id: 5,name: "Algebra", major_id:3)
# create fake enrollments
# 1st enrollment
Enrollment.create(user_id: 1, course_id:1, ta:false)
# 2nd enrollment
Enrollment.create(user_id: 1, course_id:2, ta:false)
# 3rd enrollment
Enrollment.create(user_id: 1, course_id:4, ta:false)
# 4th enrollment
Enrollment.create(user_id: 2, course_id:1, ta:false)
# 5th enrollment
Enrollment.create(user_id: 2, course_id:2, ta:true)
# th enrollment
Enrollment.create(user_id: 2, course_id:5, ta:false)
# th enrollment
Enrollment.create(user_id: 3, course_id:2, ta:false)
# th enrollment
Enrollment.create(user_id: 3, course_id:3, ta:false)
# th enrollment
Enrollment.create(user_id: 4, course_id:2, ta:true)
# th enrollment
Enrollment.create(user_id: 4, course_id:5, ta:true)
# th enrollment
Enrollment.create(user_id: 5, course_id:3, ta:false)
# th enrollment
Enrollment.create(user_id: 5, course_id:4, ta:false)
