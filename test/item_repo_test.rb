require_relative 'test_helper'

class ItemRepoTest < Minitest::Test
  attr_reader :repo

  def item_repo_data
    [
      {id: 1, name: "Item Pizza", merchant_id: 100, unit_price: 22238},
      {id: 2, name: "Item Sandwich", merchant_id: 1233, unit_price: 12345 },
      {id: 1, item: "Item Boat", description: "Family Fun" },
      {id: 2, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 11, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-05-21 18:23:19 UTC"}
    ]
  end

  def setup
    @repo = ItemRepo.new(nil, item_repo_data)
  end
  # find_by_id

  #find_by_name

  #find_by_item

  #find_by_description

  #find_by_unit_price
end
