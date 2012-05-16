class Supportbee
	def initialize(options={})
		raise "Supportbee API_TOKEN Required" if options[:api_token].nil? || options[:api_token].empty?
		@api_token = options[:api_token]
	end
	
	def ticket_url(ticket_id)
		"https://debpharma.supportbee.com/tickets/#{ticket_id}/comments.json?auth_token=#{@api_token}"	
	end
end
