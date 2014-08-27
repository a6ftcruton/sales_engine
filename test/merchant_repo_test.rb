require_relative 'test_helper'

class MerchantRepoTest < Minitest::Test
  attr_reader :repo

  def merchant_repo_data
    [
      {id: 1, name: "Schroeder-Jerde", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 2, name: "Klein, Rempel", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 3, name: "John", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}
    ]
  end

  def setup
    @repo = MerchantRepo.new(nil, merchant_repo_data)
  end

  def test_it_finds_by_id
    assert_equal 1, repo.find_by_id(1).id
  end

  def test_it_finds_all_by_id
    assert_equal 1, repo.find_all_by_id(2).count
  end

  def test_it_finds_by_name
    assert_equal "Schroeder-Jerde", repo.find_by_name("Schroeder-Jerde").name
  end

  def test_it_finds_all_by_name
    assert_equal 1, repo.find_all_by_name("Klein, Rempel").count
  end

  def test_it_finds_by_created_at
    date = Date.parse("2012-03-27 14:53:59 UTC")
    assert_equal date,
    repo.find_by_created_at(date).created_at
  end

  def test_it_finds_all_by_created_at
    date = Date.parse("2012-03-27 14:53:59 UTC")
    assert_equal 3,
    repo.find_all_by_created_at(date).count
  end

  def test_it_finds_by_updated_at
    date = Date.parse("2012-03-27 14:53:59 UTC")
    assert_equal date, repo.find_by_updated_at(date).updated_at
  end

  def test_it_finds_all_by_updated_at
    date = Date.parse("2012-03-27 14:53:59 UTC")
    assert_equal 3, repo.find_all_by_updated_at(date).count
  end

end
