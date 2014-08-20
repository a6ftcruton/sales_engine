require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/invoice_item_repo'

class InvoiceItemRepoTest < Minitest::Test
  def test_it_opens_associated_csv
    engine = SalesEngine.new
    customer_repo = InvoiceItemRepo.new(engine)
    assert customer_repo.respond_to?(:csv), "No csv method found for invoice item repo"
  end
end
