class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,:registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
         # :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # validates :name, presence: true, uniqueness: true

  

  before_save :ensure_authentication_token

  # around_update :ensure_reset_password_token

  mount_uploader :image, ImageUploader

 	def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end

  # def google_oauth2
  #     # You need to implement the method below in your model (e.g. app/models/user.rb)
  #     @user = User.from_omniauth(request.env['omniauth.auth'])

  #     if @user.persisted?
  #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #       sign_in_and_redirect @user, event: :authentication
  #     else
  #       session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #     end
  # end

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
