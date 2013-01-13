class TopicsController < InheritedResources::Base
  def index
    @topics = Topic.all
    respond_to do |format|
      format.html
      format.js
    end
  end
end
