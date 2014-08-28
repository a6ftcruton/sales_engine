require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test
  attr_reader :invoice_item
  
  def attributes
    {
    id:           1,
    item_id:      539,
    invoice_id:   1,
    quantity:     5,
    unit_price:   13655,
    created_at:   "2012-03-27 14:54:09 UTC",
    updated_at:   "2012-03-27 14:54:09 UTC"
    }
  end

  def setup
    @invoice_item = InvoiceItem.new(nil, attributes)
  end

  def test_it_can_call_quantity_method
    assert invoice_item.respond_to?(:quantity)
  end

  def test_it_stores_unit_price
    assert_equal 13655, invoice_item.unit_price
  end

  def test_it_has_a_total_price
    assert_equal 68275, invoice_item.total_price
  end
end
