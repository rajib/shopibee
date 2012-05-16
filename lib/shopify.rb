module Shopify
	class Url
		def initialize(options={})
	    raise "Shopify API_KEY Required" if options[:api_key].nil? || options[:api_key].empty?
	    raise "Shopify PASSWORD Required" if options[:password].nil? || options[:password].empty?
	    @api_key = options[:api_key]
	    @password = options[:password]
		end

		def method_missing(m)
			"https://#{@api_key}:#{@password}@shopibees.myshopify.com/admin/#{m}.json"
		end
	end
end