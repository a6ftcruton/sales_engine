require_relative 'test_helper'

class ItemsTest < Minitest::Test
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

  def test_it_stores_item_info_id_number
    item = Item.new(attributes)
    assert_equal 1, item.id
  end

  def test_it_stores_merchant_id_for_item
    item = Item.new(attributes)
    assert_equal 1, item.merchant_id
  end

  def test_it_logs_an_updated_at_time
    item = Item.new(attributes)
    assert item.respond_to?(:updated_at)
  end
end
