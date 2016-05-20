class MyProfilesController < ApplicationController
  before_action :authenticate_user!
  has_many :comments, as: :commentable

  def show
    @talent_profile = current_user.talent_profile
    render 'show'
  end

end
