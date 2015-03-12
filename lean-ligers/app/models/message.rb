class Message < ActiveRecord::Base

	validates :subject, :content, :mentor_id, :mentee_id, presence: true
  validates :read, :important, inclusion: { in: [true, false] }

  belongs_to :mentee, class: User # foreign_key: :mentee_id
  belongs_to :mentor, class: User # foreign_key: :mentor_id

	# def read(mentor)
	# 	message = Message.find_by(mentor_id: @mentor.id)
	# 	message.update(read: true)
	# end
end
