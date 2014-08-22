require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/invoice_repo'

class IntegrationTest < Minitest::Test
  def test_relationship_between_merchant_and_invoice
    engine = SalesEngine.new
    repo = MerchantRepo.new(engine)
    merchant = Merchant.new({:id => 1}, repo)
    invoices = merchant.invoices
    assert_equal 59, invoices.count
    invoices.each do |invoice|
      assert_equal 1, invoice.merchant_id
    end
    # * we were getting nil back from merchant.invoices
    # * didn't get it b/c the csv row was getting placed in the repo variable in Invoice#initialize
    # * fixed the initialize method to put the csv row in the attributes variable
    # * still not finding the invoices because we were comparing the string id to the integer id ("1"==1)
    # * fixed that by calling .to_i on the merchant_id
    # * now it found the invoice, but only found one
    # * so we looked through the method invocation chain until we saw SalesEngine was calling find_by_...
    # * we fixed it to call find_all_by...
    # * that method didn't exist, so we wrote it
    # * Now we get back the array of invoices, but we were asserting `1`
    # * So we changed the test to expect the number we got back (59)
    # * and then asserted that each invoice's merchant_id is our merchant's id (that we initialized it with)
  end

  def test_relationship_between_merchant_and_items
    engine = SalesEngine.new
    repo = MerchantRepo.new(engine)
    merchant = Merchant.new({:id => 1}, repo)
    items = merchant.items

    assert_equal 20, items.count
    items.each do |items|
      assert_equal 1, item.merchant_id
    end
  end
end
