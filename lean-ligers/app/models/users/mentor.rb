class Mentor < User
	has_many :mentorships
	has_many :mentees, through: :mentorships
end