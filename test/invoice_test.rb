require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'

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

  def test_it_stores_merchant_id
    engine = SalesEngine.new
    repo = InvoiceRepo.new(engine)
    invoice = Invoice.new(attributes, repo)
    assert_equal 26, invoice.merchant_id
  end

  def test_it_stores_status
    engine = SalesEngine.new
    repo = InvoiceRepo.new(engine)
    invoice = Invoice.new(attributes, repo)
    assert invoice.respond_to?(:status)
  end

end
