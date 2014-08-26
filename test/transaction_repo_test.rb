require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/transaction_repository'

class TransactionRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repository
  end

  def repo
    self.class.repo
  end
end
