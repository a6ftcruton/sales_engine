require_relative 'test_helper'

class MerchantRepoTest < Minitest::Test

  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repository
  end

  def repo
    self.class.repo
  end

end
