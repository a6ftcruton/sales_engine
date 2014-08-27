require 'simplecov'
SimpleCov.start
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'bigdecimal'
require 'pry'

Dir["./lib/**/*.rb"].each { |file| require "#{file}" }
