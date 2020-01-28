class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,:registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  before_save :ensure_authentication_token
  
  mount_uploader :image, ImageUploader

 	def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  def generate_authentication_token
	  loop do
	    token = Devise.friendly_token
	    break token unless User.find_by(authentication_token: token)
	  end
  end

end
