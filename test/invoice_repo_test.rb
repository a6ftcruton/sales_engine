require_relative 'test_helper'

class InvoiceRepoTest < Minitest::Test
  include ListSearch
  attr_reader :repo

  def invoice_repo_data
    [
      { id: 1100, customer_id: 7, merchant_id: 2, status: "shipped" },
      { id: 590, customer_id: 25, merchant_id: 2, status: "shipped" },
      { id: 590, customer_id: 7, merchant_id: 2, status: "shipped" },
      { id: 123, created_at: "2012-03-25 13:54:11 UTC", updated_at:"2013-03-25 13:54:11 UTC"}
    ]
  end

  def setup
    @repo = InvoiceRepo.new(nil, invoice_repo_data)
  end

  def test_it_finds_by_id
    assert_equal 1100, repo.find_by_id(1100).id
  end

  def test_it_finds_all_by_id
    assert_equal 2, repo.find_all_by_id(590).count
  end

  def test_it_finds_by_customer_id
    assert_equal 25, repo.find_by_customer_id(25).customer_id
  end

  def test_it_finds_all_by_customer_id
    assert_equal 2, repo.find_all_by_customer_id(7).count
  end

  def test_it_finds_all_by_status
    assert_equal 3, repo.find_all_by_status("shipped").count
  end

  def test_it_finds_by_status
    assert_equal 1100, repo.find_by_status("shipped").id
  end

  def test_it_finds_all_by_status
    assert_equal 3, repo.find_all_by_status("shipped").count
  end

  def test_it_finds_by_merchant_id
    assert_equal 2, repo.find_by_merchant_id(2).merchant_id
  end

  def test_it_finds_by_merchant_id
    assert_equal 3, repo.find_all_by_merchant_id(2).count
  end

  def test_it_finds_by_created_at
    assert_equal 123, repo.find_by_created_at("2012-03-25 13:54:11 UTC").id
  end

  def test_it_finds_by_updated_at
    assert_equal 123, repo.find_by_updated_at("2013-03-25 13:54:11 UTC").id
  end
end
