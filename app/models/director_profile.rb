class DirectorProfile < ActiveRecord::Base
  GENDER = ["Male", "Female"]
  EXPERIENCE = ["No Experience", "Some Experience", "Experienced", "Very Experienced"]
  COMPENSATION = ["Compensation 1", "Compensation 2", "Compensation 3"]
  CATEGORIES = ["Acting", "Exotic", "Fitness", "Lingerie", "Music Video", "Nude", "Promotional", "Swimwear"]

  belongs_to :user

  delegate :email, to: :user
end
