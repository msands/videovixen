class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  attr_accessor :login
  has_one :talent_profile, dependent: :destroy
  has_one :director_profile, dependent: :destroy
  has_many :comments

  #delegate :username, to: :talent_profile

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  TALENT_ROLE = 'talent'
  DIRCTOR_ROLE = 'director'
  NON_ADMIN_ROLES = %w[talent director]

  def talent?
    role == TALENT_ROLE
  end

  def director?
    role == DIRECTOR_ROLE
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value or lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def apply_omniauth(omniauth)
    #self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    super && (authentications.empty? || !password.blank?)
  end
end
