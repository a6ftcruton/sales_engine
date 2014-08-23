require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/customer_repo'

class CustomerRepoTest < Minitest::Test
  def attributes
    {
      id: 1,
      first_name: "Jerde",
      last_name:  "Schroeder",
      created_at: "abc",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def self.repo
    @repo ||= SalesEngine.new.startup.customer_repo
  end

  def repo
    self.class.repo
  end

  def test_it_creates_customer_instance_by_row
    assert repo.collection.kind_of?(Array)
  end

  def test_customer_is_a_collection_of_multiple_objects
    assert_equal 1000, repo.collection.count
  end

  def test_it_returns_all_rows_using_module_method
    collection = repo.collection
    assert_equal 1000, repo.all.count
  end

  def test_it_finds_by_last_name
    result = repo.find_by_last_name("Schroeder")
    assert_equal "Schroeder", result.last_name
  end

  def test_it_finds_by_first_name
    result = repo.find_by_first_name("joey")
    assert_equal "joey", result.first_name
  end

  def test_it_finds_by_created_at
    result = repo.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_finds_by_updated_at
    result = repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
  end

  def test_it_finds_all_by_first_name
    result = repo.find_all_by_first_name("sylvester")
    assert_equal 2, result.count
  end

  def test_it_finds_all_by_last_name
    results = repo.find_all_by_last_name("nader")
    assert_equal 3, results.count
  end

  def merchant_with(overrides)
    default_attributes = {
      first_name: 'John',
      last_name:  'Doe',
    }
    default_attributes.merge(overrides)
  end

  def test_it_finds_by_last_name
    merchants =  [ merchant_with(last_name: 'B'),
                   merchant_with(last_name: 'A')]
    repo = CustomerRepo.new(nil, merchants)
    assert_equal 'a', repo.find_by_last_name('a').last_name
    assert_equal 'b', repo.find_by_last_name('b').last_name
  end

end
