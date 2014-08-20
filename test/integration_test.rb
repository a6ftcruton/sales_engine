require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/invoice_repo'

class IntegrationTest < Minitest::Test
  # def test_relationship_between_merchant_and_invoice
  #   engine = SalesEngine.new
  #   repo = MerchantRepo.new(engine)
  #   merchant = Merchant.new({:id => 1}, repo)
  #   assert_equal "26", merchant.invoices("1")
  # end
  #
  # def test_relationship_between_merchant_and_items
  #   engine = SalesEngine.new
  #   repo = MerchantRepo.new(engine)
  #   merchant = Merchant.new({:id => 1}, repo)
  #   assert_equal "1", merchant.items("1").id
  # end


end
