Shopibees
=========

SupportBee Web Hook To Shopify

Adding Shopify support to SupportBee is very easy using SupportBee's web hook feature. Fork this repo and host it on heroku to get going. 

# Setting up Campfire configuration

You can setup your campfire account by setting specific ENV variables on heroku

```
$ heroku config:add SUPPORTBEE_API_TOKEN="<api_token>"
$ heroku config:add SHOPIFY_API_KEY="<api_key>"
$ heroku config:add SHOPIFY_PASSWORD="<password>"
```

Once you push the app to heroku, add the following URL in the web hook screen of supportbee

```
http://<heroku_app_url>/
```

**Once new ticket created on supportbee, a comment will be automatically posted to your supportbee app ticket if there is any customer on Shopify matches with the ticket creator!!**