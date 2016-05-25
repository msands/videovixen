class CommentsController < ApplicationController
  before_filter :load_commentable
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @talent_profile = TalentProfile.find(params[:talent_profile_id])
    @comments = @talent_profile.comments
  end

  def new
    @talent_profile = TalentProfile.find(params[:talent_profile_id])
    @talent_profile = @talent_profile.comments.new
  end

  def create
    @talent_profile = TalentProfile.find(params[:talent_profile_id])
    @comment = @talent_profile.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: "Comment successfully created!"
    else
      render :new
    end
  end

  def edit
    @talent_profile = TalentProfile.find(params[:talent_profile_id])
    @comment = @talent_profile.comments.find(params[:id])
  end

  def update
    @talent_profile = TalentProfile.find(params[:talent_profile_id])
    @comment = @talent_profile.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @commentable
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    klass = [TalentProfile, DirectorProfile].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
