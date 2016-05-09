require 'test_helper'

class VixenProfilesControllerTest < ActionController::TestCase
  setup do
    @vixen_profile = vixen_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vixen_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vixen_profile" do
    assert_difference('VixenProfile.count') do
      post :create, vixen_profile: { bio: @vixen_profile.bio, birthday: @vixen_profile.birthday, bust: @vixen_profile.bust, cup: @vixen_profile.cup, dress: @vixen_profile.dress, ethnicity: @vixen_profile.ethnicity, experience: @vixen_profile.experience, gender: @vixen_profile.gender, hair_makeup: @vixen_profile.hair_makeup, height: @vixen_profile.height, hips: @vixen_profile.hips, location: @vixen_profile.location, rate: @vixen_profile.rate, travel: @vixen_profile.travel, waist: @vixen_profile.waist, wardrobe: @vixen_profile.wardrobe, weight: @vixen_profile.weight, work: @vixen_profile.work }
    end

    assert_redirected_to vixen_profile_path(assigns(:vixen_profile))
  end

  test "should show vixen_profile" do
    get :show, id: @vixen_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vixen_profile
    assert_response :success
  end

  test "should update vixen_profile" do
    patch :update, id: @vixen_profile, vixen_profile: { bio: @vixen_profile.bio, birthday: @vixen_profile.birthday, bust: @vixen_profile.bust, cup: @vixen_profile.cup, dress: @vixen_profile.dress, ethnicity: @vixen_profile.ethnicity, experience: @vixen_profile.experience, gender: @vixen_profile.gender, hair_makeup: @vixen_profile.hair_makeup, height: @vixen_profile.height, hips: @vixen_profile.hips, location: @vixen_profile.location, rate: @vixen_profile.rate, travel: @vixen_profile.travel, waist: @vixen_profile.waist, wardrobe: @vixen_profile.wardrobe, weight: @vixen_profile.weight, work: @vixen_profile.work }
    assert_redirected_to vixen_profile_path(assigns(:vixen_profile))
  end

  test "should destroy vixen_profile" do
    assert_difference('VixenProfile.count', -1) do
      delete :destroy, id: @vixen_profile
    end

    assert_redirected_to vixen_profiles_path
  end
end
