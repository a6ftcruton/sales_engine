gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

Dir["./lib/*.rb"].each { |file| require "#{file}" }

#lib_directory = File.expand_path('../lib', __FILE__)
