class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password_digest, presence: true
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  
  

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

    def authenticate_with_credentials(email, password)
      email = email.downcase.gsub(/ /,'')
      user = User.find_by_email(email)
      if user && user.authenticate(password)
        return user
    else
      return false
    end
    
  end
end