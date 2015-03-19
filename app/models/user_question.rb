class UserQuestion < ActiveRecord::Base
	belongs_to :user
	belongs_to :question 

	validates :answer, length: { maximum: 140 }
end
