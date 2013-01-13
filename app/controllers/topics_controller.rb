class TopicsController < InheritedResources::Base
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
      flash[:success] = "judul TA sudah dibuat."
  		redirect_to @topic
  	else
  		render 'new'
  	end
  end
end
