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
    assert_equal "schroeder-jerde", merchant.name
  end

  def test_it_stores_merchant_created_at
    assert merchant.respond_to?(:created_at)
  end

  def test_it_stores_merchant_updated_at
    assert merchant.respond_to?(:updated_at)
  end

  def test_it_returns_total_revenue_for_given_merchant
    engine        = SalesEngine.new.startup
    merchant_repo = engine.merchant_repo
    merchant      = merchant_repo.collection.detect do |merchant|
                      merchant.id == 1
                    end

    revenue     = merchant.revenue

    refute_nil   revenue
    # assert_equal Transaction, revenue.class
  end

end
