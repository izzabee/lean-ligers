class User < ActiveRecord::Base
	has_secure_password
  has_many :user_questions
  has_many :questions, through: :user_questions, dependent: :destroy
  scope :mentors, -> { where(type:'Mentor') }
  scope :mentees, -> { where(type:'Mentee') }

	validates :first_name, :last_name, :email, presence: true

  def current
    respond_to do |format|
      format.json { render json: {
          id: current_user.id,
          type: current_user.type,
          email: current_user.email,
          first_name: current_user.first_name
        }
      }
    end
  end

  def homepage
    respond_to do |format|
      format.json { render json: {
          id: current_user.id,
          email: current_user.email,
          first_name: current_user.first_name
        }
      }
    end
  end

end
