class StoriesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

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

  def destroy
    @story.destroy
    redirect_back_or root_path
  end

end

