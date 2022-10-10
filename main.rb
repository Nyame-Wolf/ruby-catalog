#!/usr/bin/env ruby
require './app'

def main
  app = App.new
  puts 'Welcome to Catalog of things!'
  app.run
end

main
