require './helpers.rb'

File.open('Gemfile', 'w') { |file| file.write(make_gemfile) }