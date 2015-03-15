class Mentorship < ActiveRecord::Base
	belongs_to :user
	belongs_to :mentor, :class_name => 'User'
	belongs_to :mentee, :class_name => 'User'

	def self.request(mentee, mentor)
	  unless Mentorship.exists?(mentee, mentor)
	    transaction do
	      create(:mentee => mentee, :mentor => mentor, :status => 'Pending')
	      create(:mentor => mentee, :mentee => mentor, :status => 'Requested')
	    end
	  end
	end

	def self.accept(mentor, mentee)
    transaction do
      accepted_at = Time.now
      accept_one_side(mentor, mentee, accepted_at)
      accept_one_side(mentee, mentor, accepted_at)
    end
  end
  
end
