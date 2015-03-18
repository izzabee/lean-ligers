class Question < ActiveRecord::Base
	has_many :user_questions
	has_many :users, through: :user_questions

	validates :answer, length: { maximum: 140 }
end
