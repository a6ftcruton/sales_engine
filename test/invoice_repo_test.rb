require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/invoice_repo'

class InvoiceRepoTest < Minitest::Test
  def test_it_opens_associated_csv
    repo = SalesEngine.new.invoice_repo
    assert repo.respond_to?(:csv), "No csv method found for invoice repo"
  end
end
