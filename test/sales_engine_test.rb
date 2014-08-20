require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_it_can_create_a_new_instance
    assert SalesEngine.new
  end

  def test_it_has_access_to_all_repo_classes_after_startup
    se = SalesEngine.new
    se.startup
    assert se.respond_to?(:customer_repository)
    assert se.respond_to?(:invoice_item_repository)
    assert se.respond_to?(:invoice_repository)
    assert se.respond_to?(:item_repository)
    assert se.respond_to?(:merchant_repository)
    assert se.respond_to?(:transaction_repository)
  end
end
