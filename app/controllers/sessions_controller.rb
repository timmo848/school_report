class SessionsController < ApplicationController
  #This controller handles the creation and deletion of authenticated sessions
  # these sessions are used the restrict access to certain parts of the site
  # to logged in users only
  
  def new    
  end
  
  #Create an authenticated session for the user who is logging in
  def create 
    #Checks to see if the user exists in the database
    user = User.find_by_email(params[:session][:email].downcase)
    #Check password using the user.authenticate
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new' 
    end 
  end
  
  def destroy
    sign_out
    redirect_to root_url   
  end
  
end
