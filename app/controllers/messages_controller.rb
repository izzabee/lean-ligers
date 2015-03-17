class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where('mentor_id = ? OR mentee_id = ?', current_user.id, current_user.id).order(:created_at);
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @messages = Message.all { render :json }
  end

  # GET /messages/new
  def new
    @message = Message.new
    @mentors = Mentor.all
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @user = current_user
    
    respond_to do |format|
      if @message.save!
        format.json { render :show, status: :created, location: @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:mentor_id, :mentee_id, :subject, :content)
    end

    def user_is_current_user
      user = Mentor.find(params[:mentor_id]) || Mentee.find(params[:mentee_id])

      unless user && current_user == user
        redirect_to user_messages_path(current_user)
      end
    end
end
