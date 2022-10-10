#!/usr/bin/env ruby
require './app'

def main
  app = App.new
  puts 'Welcome to Nyame School Library App!'
  app.run
end

main
