class User < ActiveRecord::Base
	has_secure_password
	has_many :mentorships
  has_many :messages, dependent: :destroy
  scope :mentors, -> { where(type:'Mentor') }
  scope :mentees, -> { where(type:'Mentee') }

	validates :first_name, :last_name, :email, presence: true

  def current
    respond_to do |format|
      format.json { render json: {
          id: current_user.id,
          email: current_user.email,
          first_name: current_user.first_name
        }
      }
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user.type == 'Mentor'
      @mentor.new(user_params)
      if @mentor.save
        redirect_to new_session_url
      else
        render :new
      end
    else
      @mentee.new(user_params)
      if @mentee.save
        redirect_to new_session_url
      else
        render :new
      end
    end

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.authenticate(params[:user][:current_password])
      @user.update(password_params)

      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:type, :first_name, :last_name, :email, :industry, :password, :password_confirmation)
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
