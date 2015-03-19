class UserQuestionsController < ApplicationController

	def create
		@question = UserQuestion.find_or_initialize_by(user_id: current_user.id, question_id: params[:question_id])

		if @question.persisted?
			respond_to do |format|
				format.html { render html: "You've already answered this question!" } 
				format.json { render json: @mentorship }
			end
		else
			respond_to do |format|
	      if @question.save
	        format.html { redirect_to homepage_path, notice: 'Answer saved.' }
	        format.json { render :show, status: :created, location: @question }
	      else
	        format.html { render :new }
	        format.json { render json: @question.errors, status: :unprocessable_entity }
	      end
	    end
		end
	end

	def destroy
		@question = UserQuestion.find(params[:id])
		@question.destroy

    respond_to do |format|
      format.html { redirect_to homepage_path, notice: 'Answer was removed.' }
      format.json { head :no_content }
    end
	end

	def update
		@question = UserQuestion.find(params[:id])
		respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to homepage_path, notice: 'Edits saved.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
	end

	private

	def question_params
		params.require(:user_question).permit(:user_id, :question_id, :answer)
	end

end