require 'net/http'
require 'json'

def get_languages
  url = 'https://run.glot.io/languages'
  uri = URI(url)

  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  languages = data.map { |lang| lang['name'] }
end
