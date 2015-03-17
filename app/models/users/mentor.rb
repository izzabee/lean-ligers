class Mentor < User
	has_many :mentorships
	has_many :mentees, through: :mentorships
  has_many :messages, dependent: :destroy
	has_many :mentees, -> { where confirmed: true }, class_name: 'Mentorship'
	has_many :pending_requests, -> { where confirmed: false }, class_name: 'Mentorship'
end