require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/item_repo'

class ItemRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.customer_repo
  end

  def repo
    self.class.repo
  end
end
