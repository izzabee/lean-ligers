class MentorshipsController < ApplicationController

	def create
		# Izzy, I updated this -- matt.  If you have questions, ask your partner, or me.		
		@mentorship = Mentorship.find_or_initialize_by(mentor_id: params[:mentor_id], mentee_id: current_user.id)

		if @mentorship.persisted?
			respond_to do |format|
				format.html { render html: "Mentorship already exists" } 
				format.json { render json: @mentorship }
			end
		else
			respond_to do |format|
	      if @mentorship.save
	        format.html { redirect_to mentor_path(params[:mentor_id]), notice: 'Mentorship request sent.' }
	        format.json { render :show, status: :created, location: @mentorship }
	      else
	        format.html { render :new }
	        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
	      end
	    end
		end
	end

	def destroy
		@mentorship = current_user.mentorships.find(params[:id])
		@mentorship.destroy

		respond_to do |format|
      format.html { redirect_to homepage_path, notice: 'Mentorship was successfully removed.' }
      format.json { head :no_content }
    end
	end

	def update
		@mentorship = Mentorship.find(params[:id])
		@mentorship.update(confirmed: true)

		respond_to do |format|
      format.html { redirect_to homepage_path, notice: 'Mentorship was successfully created.' }
      format.json { head :no_content }
    end
	end

	private

	def mentorship_params
		params.require(:mentorship).permit(:mentor_id)
	end

end