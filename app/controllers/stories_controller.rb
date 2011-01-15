class StoriesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :find_story, :only => [:upvote, :downvote,]

  def create
    @story  = current_user.stories.build(params[:story])
    if @story.save
      flash[:success] = "Story created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def show
    @story = Story.find(params[:id])
    @current_comments = @story.comments
    @comment = Comment.new(params[:comment])
      
    #   render 'stories/show'
  end

  def upvote
    @story.upvote
    redirect_to root_path
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
    @story = Story.find(params[:story_id]) if params[:story_id]
  end

  private :find_story

end

