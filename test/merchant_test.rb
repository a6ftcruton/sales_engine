require_relative 'test_helper'

class MerchantTest < Minitest::Test
  attr_reader :merchant

  def setup
    @merchant = Merchant.new(nil, attributes)
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
    assert_equal 1, merchant.id
  end

  def test_it_stores_merchant_name
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_stores_merchant_created_at
    assert merchant.respond_to?(:created_at)
  end

  def test_it_stores_merchant_updated_at
    assert merchant.respond_to?(:updated_at)
  end

  def test_it_has_revenue
    engine   = SalesEngine.new.startup
    merchant = engine.find_merchant_by_merchant_id(1)

    assert_equal 528774, merchant.revenue.to_i
  end

  def test_it_finds_revenue_by_date

  end
end
