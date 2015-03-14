class Mentorship < ActiveRecord::Base
	belongs_to :user
	belongs_to :mentor, :class_name => 'User'
	belongs_to :mentee, :class_name => 'User'
end
