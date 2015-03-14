class MentorshipsController < ApplicationController
	def create
		@mentorship = current_user.mentorship.build(:mentee_id => params[:mentee_id])

		respond_to do |format|
      if @mentorship.save
        format.html { redirect_to @mentorship, notice: 'Mentorship request sent.' }
        format.json { render :show, status: :created, location: @mentorship }
      else
        format.html { render :new }
        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@mentorship = current_user.mentorship.find(params[:id])
		@mentorship.destroy

		respond_to do |format|
      format.html { redirect_to root_path, notice: 'Mentorship was successfully removed.' }
      format.json { head :no_content }
    end
	end

end
