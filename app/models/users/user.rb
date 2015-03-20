class User < ActiveRecord::Base
	has_secure_password
  has_many :user_questions
  has_many :questions, through: :user_questions, dependent: :destroy
  scope :mentors, -> { where(type:'Mentor') }
  scope :mentees, -> { where(type:'Mentee') }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

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
