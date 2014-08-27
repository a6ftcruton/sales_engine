require_relative 'test_helper'

class InvoiceItemRepoTest < Minitest::Test

  def self.repo
    @repo ||= SalesEngine.new.startup.invoice_item_repository
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
