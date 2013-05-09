class RepliesController < ApplicationController
  
  def create
    @reply = Reply.new(params[:reply])
    #@reply = current_user.replies.build(params[:reply])
    @topic = @reply.topic
    
    if @reply.save
      flash[:success] = "Reply created!"
      redirect_to @topic
    else
      render 'static_pages/home'
    end
  end
  
  def new

  end
  
end
