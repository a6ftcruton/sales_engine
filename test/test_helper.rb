gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'bigdecimal'
require 'simplecov'
SimpleCov.start

Dir["./lib/**/*.rb"].each { |file| require "#{file}" }
