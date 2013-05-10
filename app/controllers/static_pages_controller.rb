class StaticPagesController < ApplicationController
  #This controller handles the static pages used in the site
  
  # GET / 
  # GET /<search params>
  def home 
    #Create a user  
    @user = current_user
    #Search topics using any parameters paseed when loading the home page
    #If left blank, the search will return all topics (paginated)
    if params[:search_text]
      @search_results = Topic.paginate(page: params[:page]).where("title LIKE (?)", "%#{params[:search_text]}%")
    else
      #do nothing
    end
  end
  
  # GET /help
  #Load the help page
  def help
  end
  
  # GET /about
  #Load the about page
  def about
  end
  
  # GET /contact
  #Load the contact_us page
  def contact_us
  end
end
