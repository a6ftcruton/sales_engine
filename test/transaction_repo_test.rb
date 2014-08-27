require_relative 'test_helper'

class TransactionRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repository
  end

  def repo
    self.class.repo
  end

  #find_by_id

  #find_by_
end
