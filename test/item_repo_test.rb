require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/item_repo'

class ItemRepoTest < Minitest::Test
  def test_it_opens_associated_csv
    engine = SalesEngine.new
    customer_repo = ItemRepo.new(engine)
    assert customer_repo.respond_to?(:csv), "No csv method found for item repo"
  end
end
