class MessagesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @message = Message.new
  end
  
  def new
  
  end
  
  def create
    params["message"]["recipient"] = User.find_by_username(params["message"]["recipient"])
    @message = Message.new params["message"]
    @message.sender = current_user
    if @message.save
      redirect_to messages_path, :flash => { :success => "Pesan telah terkirim." }
    else
      redirect_to messages_path, :flash => { :error => "pesan gagal dikirim." }
    end
  end
  
  def create_message
    params["message"]["recipient"] = User.find_by_username(params["message"]["recipient"])
    @message = Message.new params["message"]
    @message.sender = current_user
    if @message.save
      flash[:success] = "Pesan telah terkirim.";
      redirect_to messages_path
    else
      redirect_to messages_path, :flash => { :error => "pesan gagal dikirim." }
    end
  end
  
  def user
    if current_user.user_type == "student"
      @user = User.user_lecture params[:term]
    elsif current_user.user_type == "lecture"
      @user = User.user_student params[:term]
    end
    render json: @user.map(&:username)
  end
  
end
