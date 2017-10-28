require 'sinatra'

BOT_NAME  = "Sample Bot"
BOT_ID    = ENV['BOT_ID']

RESPONSE_URL = "https://api.groupme.com/v3/bots/post"

# This is where regular people can go to learn about your bot
get '/' do
   'Hi. This is the mind of ' + BOT_NAME + '. You found me.'
end

# This is the callback URL for GroupMe, where your bot does all the thinking.
post '/' do
    "I am a good bot"
end
