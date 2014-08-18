require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def attributes
    {
      id: 1,
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_stores_the_merchants_id
    merchant = Merchant.new(attributes)
    assert_equal 1, merchant.id
  end

  def test_it_stores_merchant_name
    merchant = Merchant.new(attributes)
    assert_equal "Schroeder-Jerde", merchant.name
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
