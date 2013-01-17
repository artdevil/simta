class TopicsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource :except => [:user_select]
  
  def index
    @topics = Topic.all
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
  	@topic = current_user.topics.new(params[:topic])
    @topic.status = "judul baru"
  	if @topic.save
  		redirect_to @topic, :flash => { :success => "judul TA sudah dibuat." }
  	else
  		render 'new'
  	end
  end
  
  def user_select
    @user = User.user_student params[:term]
    render json: @user.map(&:username)
  end
end
