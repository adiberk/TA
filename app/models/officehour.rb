class Officehour < ApplicationRecord
	belongs_to :user, :foreign_key => 'ta_id'
	belongs_to :course
	
end
