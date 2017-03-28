class Course < ApplicationRecord
	has_many :enrollments
  has_many :users, :through => :enrollments

	has_many :enrollment_tas
	has_many :users, :through => :enrollment_tas
end
