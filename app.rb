# require 'rubygems'
require 'sinatra/base'
require 'sinatra-initializers'
require 'rest_client'
require 'json'

module Shopibee
  class App < Sinatra::Base

    register Sinatra::Initializers

    get '/' do
      "Congradulations!
      You're running a Shopibees on Heroku!"
    end

    post '/' do
      content_type :json

      json = JSON.parse(request.body.read.to_s)
      payload = json['payload']
      ticket_id = payload['ticket']['id']
      requester = payload['ticket']['requester']
      ticket_url = SUPPORTBEE.ticket_url(ticket_id)

      if payload['action_type'] == 'ticket.created'
        customers = JSON.parse(RestClient.get(SHOPIFY.customers))["customers"]

        customers.each do |customer|
          if customer["email"] == requester["email"]
            RestClient.post(
            ticket_url,
            {
              "comment" => {
              "content_attributes" => {
              "body_html" => "<p><strong>#{customer['first_name']} #{customer['last_name']}</strong> is a customer on your Shopify store.</p>", 
              "body" => "Reply Content", 
              "attachment_ids" => []}
              }
            })
          end
        end

        customers.to_json
      end
    end
  end
end


