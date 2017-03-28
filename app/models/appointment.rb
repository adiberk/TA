class Appointment < ApplicationRecord
	belongs_to :ta, :class_name => "User"
	belongs_to :student, :class_name => "User"
end
