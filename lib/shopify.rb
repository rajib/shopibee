module Shopify
  class Url
    def initialize(options={})
      raise "Shopify API_KEY Required" if options[:api_key].nil? || options[:api_key].empty?
      raise "Shopify PASSWORD Required" if options[:password].nil? || options[:password].empty?
      raise "Shopify DOMAIN Required" if options[:domain].nil? || options[:domain].empty?
      @api_key = options[:api_key]
      @password = options[:password]
      @domain = options[:domain]
    end

    def method_missing(m, subdomain)
      "https://#{@api_key}:#{@password}@#{@domain}/admin/#{m}.json"
    end
  end
end
