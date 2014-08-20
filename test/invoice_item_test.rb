require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

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

  def test_it_can_call_quantity_method
    engine = SalesEngine.new
    repo = InvoiceItemRepo.new(engine)
    invoice_item = InvoiceItem.new(attributes, repo)
    assert invoice_item.respond_to?(:quantity)
  end

  def test_it_stores_unit_price
    engine = SalesEngine.new
    repo = InvoiceItemRepo.new(engine)
    invoice_item = InvoiceItem.new(attributes, repo)
    assert_equal 13655, invoice_item.unit_price
  end

end
