require_relative 'test_helper'

class InvoiceTest < Minitest::Test
  def attributes
    {
      id:           8,
      customer_id:  1,
      merchant_id:  26,
      status:       "shipped",
      created_at:   "2012-03-27 14:53:59 UTC",
      updated_at:   "2012-03-27 14:53:59 UTC"
    }
  end

  def invoice_item_data
    [
      { invoice_id: 8, quantity: 100, unit_price: 5 },
      { invoice_id: 8, quantity: 500, unit_price: 10}
    ]
  end

  def test_it_stores_merchant_id
    invoice = Invoice.new(nil, attributes)
    assert_equal 26, invoice.merchant_id
  end

  def test_it_stores_status
    invoice = Invoice.new(nil, attributes)
    assert invoice.respond_to?(:status)
  end

  # def test_it_has_a_total
  #   repo    = InvoiceItemRepo.new(nil, invoice_item_data)
  #   invoice = Invoice.new(repo, attributes)
  #   assert_equal 5500, invoice.total.to_i
  # end
end
