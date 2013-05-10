class RepliesController < ApplicationController
  #This controller handles the creation of replies 
  # and subsequent redirections
 
  # POST /replies 
  def create
    #This will create a new reply using the parameters passed in from form
    @reply = Reply.new(params[:reply])
    
    #Get the topic for use with the redirect below
    @topic = @reply.topic    
    #If reply is successfully saved...
    if @reply.save
      #Display a message to user
      flash[:success] = "Reply created!"
      #Redirect user back to topic
      redirect_to @topic
    else
      #If unsuccessful, redirect user to home page
      render 'static_pages/home'
    end
  end 
end
