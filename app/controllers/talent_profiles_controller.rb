class TalentProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :check_profile, only: [:new, :create]

  def index
    @talent_profiles = TalentProfile.all
  end

  def show
    @talent_profile = TalentProfile.find(params[:id])
  end

  def new
    @talent_profile = TalentProfile.new
  end

  def edit
    @talent_profile = TalentProfile.find(params[:id])
  end

  def create
    @talent_profile = TalentProfile.new(talent_profile_params)
    @talent_profile.user = current_user
    if @talent_profile.save
      redirect_to my_profiles_path, notice: 'Profile was successfully saved'
    else
      flash[:error] = 'There was an error saving your profile'
      render 'new'
    end
  end

  def update
    @talent_profile = TalentProfile.find(params[:id])
    if @talent_profile.update_attributes(talent_profile_params)
      flash[:success] = "Profile updated"
      redirect_to my_profiles_path
    else
      render 'edit'
    end
  end

  def destroy
    @talent_profile.destroy
    respond_to do |format|
      format.html { redirect_to vixen_profiles_url, notice: 'Vixen profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def talent_profile_params
    params.require(:talent_profile).permit(:gender, :birthday, :location, :height_feet, :height_inches, :weight, :bust, :waist, :hips, :cup, :dress, :ethnicity, :experience, :rate, :rate_per, :travel, :hair_makeup, :wardrobe, :profile_pic, :bio, :chest, :bicep, :inseam, :suit, :glove, :hat, :shoe, :eye_color, :hair_color, :hair_length, :hair_type, :skills, ethnicity: [], work: [], languages: [])
  end
end
