require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/item_repository'

class ItemRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repository
  end

  def repo
    self.class.repo
  end
end
