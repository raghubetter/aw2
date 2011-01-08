class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @story = Story.new
      @count1 = 1
     @stories = Story.find(:all, :include => :comments)
    # @stories = Story.paginate(:page => params[:page])
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end
def poststory
    @title = "PostStory"
     @story = Story.new
 end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
