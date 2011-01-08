class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

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
   # @story = Story.find(10)
   # @microposts = @user.microposts.paginate(:page => params[:page])
     #@title = @user.name
  #  @current_comments = Story.find_by_id(params[:story_id], :include => :comments)
      @current_comments = @story.comments
        #Comment.find_by_sql("select * from comments where story_id = " + params[:user_id])
      @comment = Comment.new if signed_in?
  end

end
