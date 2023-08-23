ShopifyApp.configure do |config|
  config.api_key = "YOUR_SHOPIFY_API_KEY"
  config.secret = "YOUR_SHOPIFY_SECRET"
  config.scope = "read_customers, write_customers" # Adjust the scope as needed
  config.embedded_app = true
end