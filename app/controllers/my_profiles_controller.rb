class MyProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @talent_profile = current_user.talent_profile
    render 'show'
  end

end
