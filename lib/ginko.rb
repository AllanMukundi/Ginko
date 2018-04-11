require 'discordrb'

bot = Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'])

def help_text
    %Q{Hey, I'm Ginko, your robot code compiler. To use me properly,\
    \nsimply mention me as follows:\n\n@Ginko <language>\n\\```[language for syntax highlighting]\n<code>\n\\```\n\
    \nFor a list of supported languages, send: "@Ginko languages".\
    \nFor a link to my GitHub repo, send: "@Ginko info".}
end

bot.mention do |event|
    if event.content =~ %r{\s*(.*)\s+(```|```[a-zA-Z]+[\s]+)(.*)\s*```}
        event.respond("Let's compile!")
    elsif event.content =~ %r{languages}
        event.respond("List of languages")
    elsif event.content =~ %r{info}
        event.respond("https://github.com/AllanMukundi/Ginko")
    else
        event.respond(help_text)
    end
end

bot.run
