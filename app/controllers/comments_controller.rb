class CommentsController < ApplicationController
  before_filter :authenticate
  before_filter :find_comment, :only => [:approve,:reject,:upvote, :downvote,]

#  def index
#    @comments = Comment.find(:all, :conditions => {:moderated => 0})
#  end
#
#  def approve
#    @comment.approved
#    flash[:success] = "comment Moderated Approved!"
#    redirect_to comments_path
#  end
#
#  def reject
#    @comment.rejected
#    flash[:success] = "comment Moderated Rejected"
#    redirect_to comments_path
#  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(params[:comment])
    @comment.moderated = Comment::DEFAULT
    # @comment  = current_user.comments.build(params[:comment])
    # @comment  = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "comment added successfully! It will be published once approved by the moderator."
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
    @comment.upvote
    redirect_back_or story_path(@comment.story)
  end

  def downvote 
    @comment.downvote
    redirect_back_or root_path
  end

  def find_comment
    @comment = Comment.find(params[:id]) if params[:id]
  end

  private :find_comment
end
