class RepliesController < ApplicationController
  
  def create
    @reply = current_topic.reply.build(params[:reply])
    if @reply.save
      flash[:success] = "Reply created!"
      redirect_to current_topic_path
    else
      render 'static_pages/home'
    end
  end
  
  def new
    
  end
  
end
