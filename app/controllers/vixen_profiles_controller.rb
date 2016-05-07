class VixenProfilesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :check_profile, only: [:new, :create]

  def index
    @vixen_profiles = VixenProfile.all
  end

  def show
    @vixen_profile = VixenProfile.find(params[:id])
  end

  def new
    @vixen_profile = VixenProfile.new
  end

  def edit
    @vixen_profile = VixenProfile.find(params[:id])
  end

  def create
    @vixen_profile = VixenProfile.new(vixen_profile_params)
    @vixen_profile.user = current_user
    if @vixen_profile.save
      redirect_to my_profiles_path, notice: 'Profile was successfully saved'
    else
      flash[:error] = 'There was an error saving your profile'
      render 'new'
    end
  end

  def update
    @vixen_profile = VixenProfile.find(params[:id])
    if @vixen_profile.update_attributes(vixen_profile_paras)
      flash[:success] = "Profile updated"
      redirect_to my_profiles_path
    else
      render 'edit'
    end
  end

  def destroy
    @vixen_profile.destroy
    respond_to do |format|
      format.html { redirect_to vixen_profiles_url, notice: 'Vixen profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def vixen_profile_params
    params.require(:vixen_profile).permit(:gender, :birthday, :location, :height_feet, :height_inches, :weight, :bust, :waist, :hips, :cup, :dress, :ethnicity, :experience, :work, :rate, :travel, :hair_makeup, :wardrobe, :bio)
  end
end
