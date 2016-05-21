class DirectorProfilesController < ApplicationController

  def index
    @director_profiles = DirectorProfiles.all
  end

  def show
    @director_profile = DirectorProfile.find(params[:id])
    @commentable = @director_profile
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @director_profile = DirectorProfile.new
  end

  def edit
    @director_profile = DirectorProfile.find(params[:id])
  end

  def create
    @director_profile = DirectorProfile.new(director_profile_params)
    @director_profile.user = current_user
    if @director_profile.save
      redirect_to my_profiles_path, notice: 'Director profile was successfully saved'
    else
      flash[:error] = 'There was an error saving your profile'
      render 'new'
    end
  end

  def update
    @director_profile = DirectorProfile.find(params[:id])
    if @talent_profile.update_attributes(director_profile_params)
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end

  private

  def director_profile_params
    params.require(:director_profile).permit(:gender, :location, :experience, :compensation, :bio, :company_name, categories: [])
  end
end
