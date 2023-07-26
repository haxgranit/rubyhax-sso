class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  # Associations, validations, and other model logic go here

  # Class method to handle the OmniAuth callback data
  # and find or create the user in the database
  def self.from_omniauth(auth)
    # Try to find an existing user by the provider and uid
    user = where(provider: auth.provider, uid: auth.uid).first

    # If the user doesn't exist, create them
    unless user
      user = create(
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  # If you want to fetch additional data from the provider,
  # or perform other actions upon user creation, you can add
  # those methods here.

end