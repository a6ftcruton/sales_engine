require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/invoice_repo'

class InvoiceRepoTest < Minitest::Test
  def test_it_opens_associated_csv
    customer_repo = InvoiceRepo.new
    assert customer_repo.respond_to?(:csv), "No csv method found for invoice repo"
  end
end
