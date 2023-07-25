class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Callback method for Google OAuth2
  def google_oauth2
    handle_auth "Google"
  end

  # Callback method for Facebook
  def facebook
    handle_auth "Facebook"
  end

  private

  # General method to handle OmniAuth authentication
  def handle_auth(kind)
    # Retrieve authentication data from OmniAuth
    @user = User.from_omniauth(request.env["omniauth.auth"])

    # Check if the user persisted (was saved)
    if @user.persisted?
      # This will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication

      # Display a success message
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      # If there's an error, redirect to the registration page
      session["devise.#{kind.downcase}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # You can add more methods to handle other providers as needed.
  # For example, if you want to add Twitter:
  # def twitter
  #   handle_auth "Twitter"
  # end
end
