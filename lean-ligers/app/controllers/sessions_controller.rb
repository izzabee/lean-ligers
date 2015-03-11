class SessionsController < ApplicationController
	before_action :require_current_user, only: :destroy

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: sessions_params[:email])

		if @user && @user.authenticate(sessions_params[:password])
			login!(@user)
			redirect_to users_path
		else
			redirect_to new_session_url
		end
	end

	def destroy
		logout!

		redirect_to new_session_url
	end

	private

	def sessions_params
		@sessions_params ||= params.require(:sessions).permit(:email, :password)
	end
end
