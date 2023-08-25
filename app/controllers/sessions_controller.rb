class SessionsController < ApplicationController
  include ShopifyApp::SessionsController

  def create
    # Authenticate with Shopify
    auth_hash = request.env['omniauth.auth']
    shopify_user = auth_hash['extra']['user_info_hash']

    # Check if the customer exists in your web platform
    user = User.find_by(email: shopify_user['email'])

    if user.nil?
      # Migrate customer account information if not found
      user = User.create(
        email: shopify_user['email'],
        first_name: shopify_user['first_name'],
        last_name: shopify_user['last_name']
      # Add other fields as needed
      )
    end

    # Sign in the user to your web platform
    sign_in(user)

    # Redirect to the desired page after successful authentication
    redirect_to root_path
  end
end