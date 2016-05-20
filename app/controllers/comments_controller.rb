class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @commentable = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[comment_params])
    if @comment.save
      redirect_to @commentable, notice: "Comment successfully created!"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    klass = [TalentProfile, DirectorProfile, MyProfile].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
