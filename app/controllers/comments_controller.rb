class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @commentable = @commentable.comments
  end

  def new
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
