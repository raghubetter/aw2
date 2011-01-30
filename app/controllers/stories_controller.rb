class StoriesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :find_story, :only => [:upvote, :downvote,]

  def create
    @story  = current_user.stories.build(params[:story])
    if @story.save
      flash[:success] = "Story created!"
      redirect_to root_path
    else
      render 'shared/_story_form'
    end
  end

  def show
    p params
    p '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    @story = Story.find(params[:id])
     @comment = Comment.new(params[:comment])
      
    #   render 'stories/show'
  end

  def upvote
    @story.upvote
    flash[:notice] = "Upvoted successfully"
    redirect_to :controller => 'home', :action => :index
  end

  def downvote
    @story.downvote
    redirect_to root_path
  end

  def destroy
    @story.destroy
    redirect_back_or root_path
  end


  def find_story
    @story = Story.find(params[:id]) if params[:id]
  end

  private :find_story

end

