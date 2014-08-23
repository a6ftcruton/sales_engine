require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/invoice_item_repo'

class InvoiceItemRepoTest < Minitest::Test

#id
#quantity
#unit_price
#created_at
#updated_at
#item_id
#invoice_id

  def self.repo
    @repo ||= SalesEngine.new.startup.invoice_item_repo
  end

  def repo
    self.class.repo
  end

  def test_it_returns_all_rows_using_module_method
    assert_equal 21687, repo.all.count
  end

  def test_it_can_call_random_method_from_module
    assert repo.respond_to?(:random)
  end

end
