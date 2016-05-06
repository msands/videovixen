class MyProfilesControllerController < ApplicationController
  before_action :authenticate_user!

  def show
    @vixen_profile = current_user.user_profile
    render 'show'
  end

end
