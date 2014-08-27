require_relative 'test_helper'

class InvoiceItemRepoTest < Minitest::Test
  attr_reader :repo

  def invoice_item_data
    [
      {id: 2, item_id: 539, invoice_id: 2 },
      {id: 2, item_id: 539, invoice_id: 2 },
      {quantity: 10, unit_price: "13635"},
      {quantity: 8, unit_price: "28235"},
      {created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"},
      {created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}
    ]
  end

  def setup
    @repo = InvoiceItemRepo.new(nil, invoice_item_data)
  end

  def test_it_finds_by_id
    assert_equal 2, repo.find_by_id(2).id
  end

  def test_it_finds_all_by_id
    assert_equal 2, repo.find_all_by_id(2).count
  end

  def test_it_finds_by_item_id
    assert_equal 539, repo.find_by_item_id(539).item_id
  end

  def test_it_finds_all_by_item_id
    assert_equal 2, repo.find_all_by_item_id(539).count
  end

  def test_it_finds_by_invoice_id
    assert_equal 2, repo.find_by_invoice_id(2).invoice_id
  end

  def test_it_finds_all_by_invoice_id
    assert_equal 2, repo.find_all_by_invoice_id(2).count
  end

  def test_it_finds_by_quantity
    assert_equal 10, repo.find_by_quantity(10).quantity
  end

  def test_it_finds_all_by_quantity
    assert_equal 1, repo.find_all_by_quantity(10).count
  end

  def test_it_finds_by_unit_price
    assert_equal "13635", repo.find_by_unit_price("13635").unit_price
  end

  def test_it_finds_all_by_unit_price
    assert_equal 1, repo.find_all_by_unit_price("13635").count
  end

  def test_it_finds_by_created_at
    assert_equal "2012-03-27 14:54:09 UTC",
    repo.find_by_created_at("2012-03-27 14:54:09 UTC").created_at
  end

  def test_it_finds_all_by_created_at
    assert_equal 2,
    repo.find_all_by_created_at("2012-03-27 14:54:09 UTC").count
  end

  def test_it_finds_by_updated_at
    assert_equal "2012-03-27 14:54:09 UTC",
    repo.find_by_updated_at("2012-03-27 14:54:09 UTC").updated_at
  end

  def test_it_returns_all_rows_using_module_method
    assert_equal 6, repo.all.count
  end

  def test_it_can_call_random_method_from_module
    assert repo.respond_to?(:random)
  end

end
