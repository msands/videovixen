class VixenProfile < ActiveRecord::Base
  GENDERS = ["Female", "Male"]
  HEIGHT = ["5'", "5'1", "5'2", "5'3", "5'4", "5'5", "5'6", "5'7", "5'8", "5'9", "5'10", "5'11", "6'", "6'1", "6'2", "6'3", "6'4", "6'5"]
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

  delegate :email, to: :user
end
