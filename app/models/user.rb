class User < ActiveRecord::Base

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if User.find_by_email(email.downcase.strip).authenticate(password)
      return User.find_by_email(email.downcase.strip)
    end
    return nil
  end

end
