require 'sinatra'
require 'open-uri'
require 'net/http'
require 'json'

DEBUG_MODE    = ENV['DEBUG_MODE']
BOT_NAME      = "Sample Bot"
BOT_ID        = ENV['BOT_ID']
RESPONSE_URL  = "https://api.groupme.com/v3/bots/post"

# This is where regular people can go to learn about your bot
get '/' do
   'Hi. This is the mind of ' + BOT_NAME + '. You found me.'
end

# This is the callback URL for GroupMe, where your bot does all the thinking.
post '/' do
    # Parse information from GroupMe
    groupme = JSON.parse(request.body.read)
    # Available attributes:
    # => attachments
    # => avatar_url
    # => created_at
    # => group_id
    # => id
    # => name
    # => sender_id
    # => sender_type
    # => source_guid
    # => system
    # => text
    # => user_id

    if groupme['text'].downcase == "who are you?" then
      send_response("Hi, my name is " + BOT_NAME + ". Nice to meet you.")
    end

    'Bot execution complete.'
end


# Helper function to send response back to GroupMe
def send_response(text)
  params = {"bot_id" => BOT_ID, "text" => text}
  resp = Net::HTTP.post_form(URI.parse(RESPONSE_URL), params)
end
