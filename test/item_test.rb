require_relative 'test_helper'

class ItemsTest < Minitest::Test
  attr_reader :item
  
  def attributes
    {
      id:           1,
      name:         "Jerde",
      description:  "This is a totally rockin' toy",
      unit_price:   68590,
      merchant_id:  1,
      created_at:   "2012-03-27 14:53:59 UTC",
      updated_at:   "2012-03-27 14:53:59 UTC"
    }
  end

  def setup
    @item = Item.new(nil, attributes)
  end

  def test_it_stores_item_info_id_number
    assert_equal 1, item.id
  end

  def test_it_stores_merchant_id_for_item
    assert_equal 1, item.merchant_id
  end

  def test_it_logs_an_updated_at_time
    assert item.respond_to?(:updated_at)
  end
end
