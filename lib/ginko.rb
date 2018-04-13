require 'discordrb'
require_relative 'glot_api'

bot = Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'])

RUN_REGEX = %r{\s*(.+)\s+(.+)\s+(```\w+\n+|```)([\s\S]+)```}

def languages(event)
  language_list = get_languages
  resp = 'I am able to run code written in:'
  language_list.each { |lang| resp += " #{lang}"}
  event.respond(resp)
end

def run_code(event, language, code)
  begin
    run(event, language, code)
  rescue
    event.respond(%Q{I cannot run code in #{language}, enter "@Ginko languages" to see my language options.})
  end
end

def help_text
    %Q{Hey, I'm Ginko, your robot code executor. To use me properly,\
    \nsimply mention me as follows:\n\n@Ginko <language>\n\\```[language for syntax highlighting]\n<code>\n\\```\n\
    \nFor a list of supported languages, send: "@Ginko languages".\
    \nFor a link to my GitHub repo, send: "@Ginko info".}
end

bot.mention do |event|
    if event.content =~ RUN_REGEX
      data = event.content.match(RUN_REGEX).captures
      run_code(event, data[1], data[3])
    elsif event.content =~ %r{languages}
      languages(event)
    elsif event.content =~ %r{info}
        event.respond("https://github.com/AllanMukundi/Ginko")
    else
        event.respond(help_text)
    end
end

bot.run
