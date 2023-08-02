require 'omniauth-facebook'

# OmniAuth configuration
Rails.application.config.middleware.use OmniAuth::Builder do
  # Configuration for Google OAuth2
  # You'll need to get your CLIENT_ID and CLIENT_SECRET from the Google Developer Console.
  provider :google_oauth2, 'YOUR_GOOGLE_CLIENT_ID', 'YOUR_GOOGLE_CLIENT_SECRET',
           {
             # This will prompt the user to choose an account every time they log in.
             prompt: 'select_account',

             # Specify the desired OAuth 2.0 scopes (e.g., 'userinfo.email', 'userinfo.profile')
             scope: 'email,profile'
           }

  # Configuration for Facebook OAuth
  # You'll need to get your APP_ID and APP_SECRET from the Facebook Developer Dashboard.
  provider :facebook, 'YOUR_FACEBOOK_APP_ID', 'YOUR_FACEBOOK_APP_SECRET',
           {
             # Request the permissions you need (e.g., 'email', 'public_profile')
             scope: 'email,public_profile',

             # Specify the display type (e.g., 'page', 'popup', 'touch')
             display: 'page'
           }

  # Configuration for Azure Active Directory (v2)
  # You'll need to get your AZURE_CLIENT_ID and AZURE_CLIENT_SECRET from the Azure portal.
  provider(:azure_activedirectory_v2,
    {
      client_id:     ENV['AZURE_CLIENT_ID'],
      client_secret: ENV['AZURE_CLIENT_SECRET']
    }
  )
  # Add other providers as needed
end

# Handling OmniAuth failures
OmniAuth.config.on_failure = proc do |env|
  # In case of a failure, redirect to the failure endpoint
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end
