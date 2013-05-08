class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :new]
  
  def show
    @topic = Topic.find(params[:id])
    @replies = @topic.replies
  end
  
  def create
    @topic = current_user.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Topic created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def new
    @topic = Topic.new
  end

  def index
    @topics = @user.topics.paginate(page: params[:page])
  end

  def destroy
  end
end