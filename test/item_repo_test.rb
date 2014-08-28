require_relative 'test_helper'

class ItemRepoTest < Minitest::Test
  attr_reader :repo

  def item_repo_data
    [
      {id: 1, name: "Item Pizza", merchant_id: 100, unit_price: "22238"},
      {id: 2, name: "Item Sandwich", merchant_id: 1233, unit_price: "12345" },
      {id: 1, name: "Item Boat", description: "Family Fun", unit_price: "56" },
      {id: 2, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 11, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-05-21 18:23:19 UTC"}
    ]
  end

  def setup
    @repo = ItemRepo.new(nil, item_repo_data)
  end

  def test_it_finds_by_id
    assert_equal 1, repo.find_by_id(1).id
    assert_nil repo.find_by_id(100)
  end

  def test_it_finds_all_by_id
    assert_equal 2, repo.find_all_by_id(1).count
  end

  def test_it_finds_by_name
    assert_equal "Item Pizza", repo.find_by_name("Item Pizza").name
  end

  def test_it_finds_all_by_name
    assert_equal 1, repo.find_all_by_name("Item Pizza").count
  end

  def test_it_finds_by_description
    refute_nil repo.find_by_description("Family Fun").description

    assert_equal "Family Fun",
    repo.find_by_description("Family Fun").description
  end

  def test_it_finds_all_by_description
    assert_equal 1, repo.find_all_by_description("Family Fun").count
  end

  def test_it_finds_by_created_at
    assert_equal "2012-03-27 14:53:59 UTC",
    repo.find_by_created_at("2012-03-27 14:53:59 UTC").created_at
  end

  def test_it_finds_all_by_created_at
    assert_equal 2,
    repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
  end

  def test_it_finds_by_updated_at
    assert_equal "2012-03-27 14:53:59 UTC",
    repo.find_by_updated_at("2012-03-27 14:53:59 UTC").updated_at
  end

  def test_it_finds_all_by_created_at
    assert_equal 1,
    repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").count
  end

  def test_it_formats_unit_price
    assert_equal 123.45, repo.format_price("12345")
    assert_equal 0.56, repo.format_price("56")
  end

  def test_it_finds_by_unit_price
    assert repo.find_by_unit_price(123.45)
  end
end
