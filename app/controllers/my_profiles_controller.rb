class MyProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @talent_profile = current_user.talent_profile
    render 'show'
    @commentable = @talent_profile || @director_profile
    @comments = @commentable.comments
    @comment = Comments.new
  end

end
