class User < ActiveRecord::Base
  has_many :profiles

  attr_accessor :password
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
