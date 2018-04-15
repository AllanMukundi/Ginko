require_relative 'ginko'

ginko = Ginko.new(ENV['DISCORD_TOKEN'], ENV['GLOT_TOKEN'])

ginko.run
