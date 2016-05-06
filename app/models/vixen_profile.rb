class VixenProfile < ActiveRecord::Base
  GENDERS = ["Female", "Male"]
  HEIGHT_FEET = ["4", "5", "6"]
  HEIGHT_INCHES = (0..11)
  WEIGHT = (100..250)
  BUST = (32..42).step(2)
  WAIST = (24..34).step(2)
  HIPS = (34..44).step(2)
  CUPS = ["AA", "A", "B", "C", "D", "DD", "DDD/F", "G"]
  DRESS_SIZE = (2..16).step(2)
  ETHNICITIES = ["Black", "White", "Asian", "Hispanic", "Other"]
  EXPERIENCE = ["No Experience", "Some Experience", "Experienced", "Very Experienced"]
  WORK = ["Acting", "Exotic", "Fitness", "Lingerie", "Music Video", "Nude", "Promotional", "Swimwear"]
  TRAVEL = ["Yes", "No", "Depending on distance"]
  HAIR_MAKEUP = ["Own Hair", "Own Makeup", "Both", "None"]
  WARDROBE = ["Yes", "No"]

  belongs_to :user

  validates :gender, presence: true
  acts_as_birthday :birthday

  delegate :email, to: :user
end
