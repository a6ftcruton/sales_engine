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
    item = Item.new(nil, attributes)
    assert_equal 1, item.id
  end

  def test_it_stores_merchant_id_for_item
    item = Item.new(nil, attributes)
    assert_equal 1, item.merchant_id
  end

  def test_it_logs_an_updated_at_time
    item = Item.new(nil, attributes)
    assert item.respond_to?(:updated_at)
  end

  #Business Intelligence Tests
  # returns the date with the most sales for the given item using the invoice date
  # pass in item id to invoice_items, group the collection of results based
  # on date, choose date with the most results
  # def test_it_takes_in_an_item_and_searches_invoice_date
  #   engine = SalesEngine.new.startup
  #   item_repo = engine.item_repository
  #   items = item_repo.find_items_associated_with_invoice_id(id)
  #
  #   assert_equal "date", item.best_day
  # end

end
