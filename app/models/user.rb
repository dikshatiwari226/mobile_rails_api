class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,:registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true, uniqueness: true

  

  before_save :ensure_authentication_token

  # around_update :ensure_reset_password_token
  
  mount_uploader :image, ImageUploader

 	def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  # def ensure_reset_password_token
  #   if reset_password_token.blank?
  #     self.reset_password_token = generate_reset_password_token
  #   end
  # end

  private
  def generate_authentication_token
	  loop do
	    token = Devise.friendly_token
	    break token unless User.find_by(authentication_token: token)
	  end
  end

  # def generate_reset_password_token
  #   raw, enc = Devise.token_generator.generate(User, :reset_password_token)
  #   self.reset_password_token   = enc
  #   self.reset_password_sent_at = Time.now.utc
  #   self.save(validate: false)
  # end

end
