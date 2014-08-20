require_relative 'test_helper'

class MerchantTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
    @repo = MerchantRepo.new(@engine)
    @merchant = Merchant.new(attributes, @repo)
  end

  def attributes
    {
      id: 1,
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_stores_the_merchants_id
    assert_equal 1, @merchant.id
  end

  def test_it_stores_merchant_name
    assert_equal "Schroeder-Jerde", @merchant.name
  end

  def test_it_stores_merchant_created_at
    merchant = Merchant.new(attributes)
    assert merchant.respond_to?(:created_at)
  end

  def test_it_stores_merchant_updated_at
    merchant = Merchant.new(attributes)
    assert merchant.respond_to?(:updated_at)
  end

end
