class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :new]
  
  # GET /topics/<topic id>
  #Show individual topics
  def show 
    #create topic for display
    @topic = Topic.find(params[:id]) 
    #get all replies related to topic   
    @replies = @topic.replies
    #prepare a new reply
    @reply = Reply.new
    #Get currently signed in user
    @user = current_user
  end
  
  # POST /
  def create
    #Create a topic using POST params
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