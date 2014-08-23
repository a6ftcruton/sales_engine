require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_it_can_create_a_new_instance
    assert SalesEngine.new.startup
  end

  def test_it_has_access_to_all_repo_classes_after_startup
    se = SalesEngine.new.startup
    se.startup
    assert se.respond_to?(:customer_repo)
    assert se.respond_to?(:invoice_item_repo)
    assert se.respond_to?(:invoice_repo)
    assert se.respond_to?(:item_repo)
    assert se.respond_to?(:merchant_repo)
    assert se.respond_to?(:transaction_repo)
  end

  def test_it_opens_a_csv

  end

end
