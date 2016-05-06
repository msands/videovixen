class MyProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @vixen_profile = current_user.vixen_profile
    render 'show'
  end

end
