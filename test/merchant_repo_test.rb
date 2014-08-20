require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'

class MerchantRepoTest < Minitest::Test
  def test_it_opens_associated_csv
    engine = SalesEngine.new
    customer_repo = MerchantRepo.new(engine)
    assert customer_repo.respond_to?(:csv), "No csv method found for Merchant repo"
  end
end
