class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #attr_accessible :email, :password, :password_confirmation, :remember_me, :roles

  #roles_attribute :roles_mask

  #roles :admin, :editor, :guest

  attr_accessor :password
  #validates :user_name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => {:with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?}
  validates :password, :confirmation => true, :length => { :minimum => 6, :maximum => 15 } #password_confirmation attr

  before_save :encrypt_password
  after_save :clear_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
      self.password = nil
  end
end
