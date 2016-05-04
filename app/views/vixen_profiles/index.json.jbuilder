json.array!(@vixen_profiles) do |vixen_profile|
  json.extract! vixen_profile, :id, :gender, :birthday, :location, :height, :weight, :bust, :waist, :hips, :cup, :dress, :ethnicity, :experience, :work, :rate, :travel, :hair_makeup, :wardrobe, :bio
  json.url vixen_profile_url(vixen_profile, format: :json)
end
