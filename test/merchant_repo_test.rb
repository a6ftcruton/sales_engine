require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'

class MerchantRepoTest < Minitest::Test

  def self.repo
    @repo ||= SalesEngine.new.customer_repo
  end

  def repo
    self.class.repo
  end

end
