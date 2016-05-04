class VixenProfilesController < ApplicationController
  before_action :set_vixen_profile, only: [:show, :edit, :update, :destroy]

  def index
    @vixen_profiles = VixenProfile.all
  end

  def show
  end

  def new
    @vixen_profile = VixenProfile.new
  end

  def edit
  end

  def create
    @vixen_profile = VixenProfile.new(vixen_profile_params)

    respond_to do |format|
      if @vixen_profile.save
        format.html { redirect_to @vixen_profile, notice: 'Vixen profile was successfully created.' }
        format.json { render :show, status: :created, location: @vixen_profile }
      else
        format.html { render :new }
        format.json { render json: @vixen_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vixen_profile.update(vixen_profile_params)
        format.html { redirect_to @vixen_profile, notice: 'Vixen profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @vixen_profile }
      else
        format.html { render :edit }
        format.json { render json: @vixen_profile.errors, status: :unprocessable_entity }
      end
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

  def set_vixen_profile
    @vixen_profile = VixenProfile.find(params[:id])
  end

  def vixen_profile_params
    params.require(:vixen_profile).permit(:gender, :birthday, :location, :height, :weight, :bust, :waist, :hips, :cup, :dress, :ethnicity, :experience, :work, :rate, :travel, :hair_makeup, :wardrobe, :bio)
  end
end
