require 'discordrb'
require_relative './glot_api'

class Ginko

  RUN_REGEX = %r{\s*(.+)\s+(.+)\s+(```\w+\n+|```)([\s\S]+)```}

  def initialize(discord_token, glot_token)
    @bot = Discordrb::Bot.new(token: discord_token)
    @glot = Glot.new(glot_token)
  end

  def languages(event)
    language_list = @glot.languages
    resp = 'I am able to run code written in:'
    language_list.each { |lang| resp += " #{lang}"}
    event.respond(resp)
  end

  def run_code(event, language, code)
    @glot.run(event, language.downcase.strip, code)
  end

  def help_text
      %Q{Hey, I'm Ginko, your robot code executor. To use me properly,\
      \nsimply mention me as follows:\n\n@Ginko <language>\n\\```[language for syntax highlighting]\n<code>\n\\```\n\
      \nFor a list of supported languages, send: "@Ginko languages".\
      \nFor a link to my GitHub repo, send: "@Ginko info".}
  end

  def run
    @bot.mention do |event|
        if event.content =~ RUN_REGEX
          data = event.content.match(RUN_REGEX).captures
          run_code(event, data[1], data[3])
        elsif event.content.downcase =~ %r{languages}
          languages(event)
        elsif event.content.downcase =~ %r{info}
            event.respond("https://github.com/AllanMukundi/Ginko")
        else
            event.respond(help_text)
        end
    end
    @bot.run
  end
end
