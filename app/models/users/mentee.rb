class Mentee < User
	has_many :mentorships
	has_many :mentors, through: :mentorships
  has_many :messages, dependent: :destroy
	has_many :mentors, -> { where confirmed: true }, class_name: 'Mentorship'
	has_many :pending_requests, -> { where confirmed: false }, class_name: 'Mentorship'
end