require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/transaction_repo'

class TransactionRepoTest < Minitest::Test

  def test_it_opens_associated_csv
    engine = SalesEngine.new
    repo = TransactionRepo.new(engine)
    assert repo.respond_to?(:csv), "No csv method found for transaction repo"
  end
end
