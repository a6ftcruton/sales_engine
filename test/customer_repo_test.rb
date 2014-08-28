require_relative 'test_helper'

class CustomerRepoTest < Minitest::Test
  attr_reader :repo

  def customer_repo_data
    [
      {id: 1, first_name: "Sam", last_name: "Bam", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 2, first_name: "Sam", last_name: "Jones", updated_at: "2012-03-27 14:53:59 UTC"},
      {id: 3, first_name: "Joe", last_name: "Baggins", updated_at: "2012-03-27 14:53:59 UTC"},    ]
  end

  def setup
    @repo = CustomerRepo.new(nil, customer_repo_data)
  end

  def test_it_creates_customer_instance_by_row
    assert repo.collection.kind_of?(Array)
  end

  def test_customer_is_a_collection_of_multiple_objects
    assert_equal 3, repo.collection.count
  end

  def test_it_finds_by_last_name
    result = repo.find_by_last_name("Bam")
    assert_equal "Bam", result.last_name
  end

  def test_it_finds_by_first_name
    assert_equal "Joe", repo.find_by_first_name("Joe").first_name
  end

  def test_it_finds_by_created_at
    result = repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_finds_by_updated_at
    result = repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", result.updated_at
  end

  def test_it_finds_all_by_first_name
    result = repo.find_all_by_first_name("Sam")
    assert_equal 2, result.count
  end

  def test_it_finds_all_by_last_name
    results = repo.find_all_by_last_name("Jones")
    assert_equal 1, results.count
  end
end
