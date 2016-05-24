class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  attr_accessor :login
  has_one :talent_profile || :director_profile, dependent: :destroy
  has_many :comments

  #delegate :username, to: :talent_profile

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  # after_initialize :create_login, :if => :new_record?

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**NON_ADMIN_ROLES.index(role.to_s)} > 0 "} }

  NON_ADMIN_ROLES = %w[talent director]

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

  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address#gmail-or-mecom-style
  #
  # def create_login
  #   if self.username.blank?
  #     email = self.email.split(/@/)
  #     login_taken = Pro.where(:username => email[0]).first
  #     unless login_taken
  #       self.username = email[0]
  #     else
  #       self.username = self.email
  #     end
  #   end
  # end

  def roles=(roles)
    self.roles_mask = (roles & NON_ADMIN_ROLES).map { |r| 2**NON_ADMIN_ROLES.index(r) }.sum
  end

  def roles
    NON_ADMIN_ROLES.reject { |r| ((roles_mask || 0) & 2**NON_ADMIN_ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end

end
