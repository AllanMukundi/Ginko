require 'net/http'
require 'json'

class Glot

  def initialize(token)
    @token = token
  end

  def languages
    url = 'https://run.glot.io/languages'
    uri = URI(url)

    json_response = Net::HTTP.get(uri)
    response = JSON.parse(json_response)
    languages = response.map { |lang| lang['name'] }
  end

  def run(event, language, code)
    url = "https://run.glot.io/languages/#{language}/latest"
    uri = URI(url)

    data = {
      'files' => [{'name' => 'main', 'content' => code}]
    }

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(uri)

    request['Authorization'] = "Token #{@token}"
    request['Content-type'] = 'application/json'

    request.body = data.to_json
    response = JSON.parse(https.request(request).body)

    stdout = response['stdout']
    stderr = response['stderr']
    error = response['error']

    event.respond("STDOUT :white_check_mark::\n```\n#{stdout}```") if stdout != ''
    event.respond("STDERR :x::\n```\n#{stderr}```") if stderr != ''
    event.respond("ERROR :loudspeaker::\n```\n#{error}```") if error != ''
  end
end
