require_relative 'test_helper'

class TransactionRepoTest < Minitest::Test
  attr_reader :repo

# id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at
# 1,1,4654405418249632,,success,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC

  def transaction_repo_data
    [
      {id: 1, invoice_id: 12, credit_card_number: 4654405418249632, result: "failed"},
      {id: 12, credit_card_number: 4017503416578382, result: "success"},
      {id: 61, credit_card_expiration_date: "", result: "success"},
      {created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"},
      {created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-28 13:51:19 UTC"}
    ]
  end

  def setup
    @repo = TransactionRepo.new(nil, transaction_repo_data)
  end

  def test_it_finds_by_id
    assert_equal 1, repo.find_by_id(1).id
  end

  def test_it_finds_all_by_id
    assert_equal 1, repo.find_all_by_id(1).count
  end

  def test_it_finds_by_invoice_id
    assert_equal 12, repo.find_by_invoice_id(12).invoice_id
  end

  def test_it_finds_all_by_invoice_id
    assert_equal 1, repo.find_all_by_invoice_id(12).count
    assert_empty repo.find_all_by_invoice_id(100)
  end

  def test_it_finds_by_credit_card_number
    assert_equal 4017503416578382,
    repo.find_by_credit_card_number(4017503416578382).credit_card_number
  end

  def test_it_finds_all_by_credit_card_number
    assert_equal 1,
    repo.find_all_by_credit_card_number(4017503416578382).count
  end

  def test_it_returns_nil_for_invalid_credit_card_number
    assert_nil repo.find_by_credit_card_number(44444)
  end

  def test_it_finds_by_result
    assert_equal "success", repo.find_by_result("success").result
    assert_equal "failed", repo.find_by_id(1).result
  end

  def test_it_finds_all_by_result
    assert_equal 1, repo.find_all_by_result("failed").count
    assert_equal 2, repo.find_all_by_result("success").count
  end

  def test_it_finds_by_expiration_date
    assert_nil repo.find_by_credit_card_expiration("")
  end

  def test_it_finds_by_updated_at
    assert_equal "2012-03-27 14:54:09 UTC",
    repo.find_by_updated_at("2012-03-27 14:54:09 UTC").updated_at
  end

  def test_it_finds_by_created_at
    assert_equal "2012-03-27 14:54:09 UTC",
    repo.find_by_created_at("2012-03-27 14:54:09 UTC").created_at
  end

  def test_it_finds_all_by_created_at
    assert_equal 2,
    repo.find_all_by_created_at("2012-03-27 14:54:09 UTC").count
  end

  def test_it_finds_all_by_updated_at
    assert_equal 1,
    repo.find_all_by_updated_at("2012-03-28 13:51:19 UTC").count

    assert_empty repo.find_all_by_updated_at("2012-03-28 13:51:11 UTC")
  end



end
