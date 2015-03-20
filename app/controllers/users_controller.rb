class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.where(type: params[:type])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.where(type: params[:type]).find(params[:id])
  end

  # GET /hompage
  def homepage
    @userquestion = UserQuestion.all

    rand_id = rand(Question.count)
    @question = Question.where("id >= ?", rand_id).first
  end

  # GET /users/new
  def new
    @user = User.new
    @user.type = params[:type]
  end

  # GET /users/1/edit
  def edit
    @user = User.new
    @user.type = params[:type]
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:type] == 'Mentor'
      @mentor = Mentor.new(user_params)
      respond_to do |format|
        if @mentor.save
          login!(@mentor)
          format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
          format.json { render :show, status: :created, location: @mentor }
        else
          format.html { render :new }
          format.json { render json: @mentor.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:user][:type] == 'Mentee'
      @mentee = Mentee.new(user_params)
      respond_to do |format|
        if @mentee.save
          login!(@mentee)
          format.html { redirect_to @mentee, notice: 'Mentee was successfully created.' }
          format.json { render :show, status: :created, location: @mentee }
        else
          format.html { render :new }
          format.json { render json: @mentee.errors, status: :unprocessable_entity }
        end
      end
    else
      render :text => 'Oops something went wrong! Please try again.'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:mentor]
      respond_to do |format|
        if current_user.update(mentor_params)
          format.html { redirect_to homepage_path, notice: 'Edits saved.' }
          format.json { render :show, status: :ok, location: @mentor }
        else
          format.html { render :edit }
          format.json { render json: @mentor.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:mentee]
      respond_to do |format|
        if current_user.update(mentee_params)
          format.html { redirect_to homepage_path, notice: 'Edits saved.' }
          format.json { render :show, status: :ok, location: @mentee }
        else
          format.html { render :edit }
          format.json { render json: @mentee.errors, status: :unprocessable_entity }
        end
      end
    else
      render :text => 'Oops something went wrong! Please try again.'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.type = params[:type]
    @user.destroy
    logout!(@user)
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = Mentee.find(params[:id]) || Mentor.find(params[:id])
  end

  # Only these parameters can be passed through the form
  def user_params
    params.require(:user).permit(:type, :first_name, :last_name, :email, :location, :current_job, :industry, :quote, :fun_fact, :site, :avatar, :password, :password_confirmation)
  end

  def mentee_params
    params.require(:mentee).permit(:type, :first_name, :last_name, :email, :location, :current_job, :industry, :quote, :fun_fact, :site, :avatar, :password, :password_confirmation)
  end

  def mentor_params
    params.require(:mentor).permit(:type, :first_name, :last_name, :email, :location, :current_job, :industry, :quote, :fun_fact, :site, :avatar, :password, :password_confirmation)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_is_current_user
    user = User.find(params[:id])

    if current_user
      redirect_to user_path(current_user) unless user == current_user
    else
      redirect_to new_session_path
    end
  end
end
