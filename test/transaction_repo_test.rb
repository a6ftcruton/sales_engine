require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/transaction_repo'

class TransactionRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repo
  end

  def repo
    self.class.repo
  end
end
