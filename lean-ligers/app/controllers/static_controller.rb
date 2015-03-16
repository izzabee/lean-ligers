class StaticController < ApplicationController

	def index
		@user = User.new
		@user.type = params[:type]
		@mentors = Mentor.all
	end

end
