SHOPIFY = Shopify::Url.new({
  :api_key => ENV['SHOPIFY_API_KEY'],
  :password => ENV['SHOPIFY_PASSWORD'],
  :domain => ENV['SHOPIFY_DOMAIN']
})
