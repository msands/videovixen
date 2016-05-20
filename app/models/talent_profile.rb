class TalentProfile < ActiveRecord::Base
  GENDERS = ["Female", "Male"]
  HEIGHT_FEET = ["4", "5", "6"]
  HEIGHT_INCHES = (0..11)
  WEIGHT = (100..300).step(5)
  EYE = ["Brown", "Blue", "Green", "Gray", "Hazel"]
  HAIR_COLOR = ["Black", "Blonde", "Brunette", "Gray", "Other"]
  HAIR_LENGTH = ["Short", "Medium", "Long"]
  HAIR_TYPE = ["Straight", "Curly", "Natural", "Dreadlocks"]
  BUST = (32..42).step(2)
  WAIST = (24..34).step(2)
  HIPS = (34..44).step(2)
  CUPS = ["AA", "A", "B", "C", "D", "DD", "DDD/F", "G"]
  DRESS_SIZE = (2..16).step(2)
  CHEST = (40..56).step(2)
  BICEP = (16..24).step(0.5)
  INSEAM = (28..36).step(2)
  SUIT = (40..56).step(2)
  GLOVE = (8..12)
  HAT = (6..8).step(0.25)
  SHOE = (8..14).step(0.5)
  ETHNICITIES = ["Black", "White", "Asian", "Hispanic", "Native American", "Native Hawaiian", "Middle Eastern", "Other"]
  LANGUAGES = ["English", "Spanish", "French", "Portuguese", "Other"]
  EXPERIENCE = ["No Experience", "Some Experience", "Experienced", "Very Experienced"]
  WORK = ["Acting", "Exotic", "Fitness", "Lingerie", "Music Video", "Nude", "Promotional", "Swimwear"]
  RATE_PER = ["Hour", "Day", "Week"]
  TRAVEL = ["Yes", "No", "Depending on distance"]
  HAIR_MAKEUP = ["Own Hair", "Own Makeup", "Both", "None"]
  WARDROBE = ["Yes", "No"]

  belongs_to :user
  has_many :comments, as: :commentable

  validates :gender, presence: true
  acts_as_birthday :birthday

  has_attached_file :profile_pic, styles: { profile: "200x266>", medium: "300x225>" }, default_url: "default/missing_:style.jpg"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  delegate :email, to: :user
end
