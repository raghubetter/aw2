class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :find_comment, :only => [:upvote, :downvote,]
  
  def new
    @comment = Comment.new
  end
  
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(params[:comment])
    # @comment  = current_user.comments.build(params[:comment])
   # @comment  = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_path
    else
 #   render 'pages/home'
    end
  end

  def destroy
    @comment.destroy
    redirect_back_or root_path
  end

  def show
   @story = Story.find(params[:id])
      @current_comments = @story.comments
      @comment = Comment.new if signed_in?
  end

  def upvote
    p @comment.story
    @comment.upvote
    redirect_back_or story_path(@comment.story)
  end

  def downvote 
    @comment.downvote
    redirect_back_or root_path
  end

  def find_comment
    p '*********************************************************'
    p params
    @comment = Comment.find(params[:id]) if params[:id]
  end

  private :find_comment
end
