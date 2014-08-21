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
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def repo
    @repo ||= SalesEngine.new.customer_repo
  end

  def test_it_opens_associated_csv
    assert repo.respond_to?(:csv), "No csv method found for CustomerRepo"
  end

  def test_it_creates_customer_instance_by_row
    assert repo.collection.kind_of?(Array)
  end

  def test_customer_is_a_collection_of_multiple_objects
    assert_equal 1000, repo.collection.count
  end

  def test_it_returns_all_rows_using_module_method
    collection = repo.collection
    assert_equal 1000, repo.all(collection).count
  end

  def test_it_finds_by_last_name
    result = repo.find_by_last_name("Schroeder")
    assert_equal "Schroeder", result.last_name
  end

  def test_it_finds_by_first_name
    result = repo.find_by_first_name("Joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_finds_all_by_first_name
    result = repo.find_all_by_first_name("Sylvester")
    assert_equal 2, result.count
  end

  def test_it_finds_all_by_last_name
    results = repo.find_all_by_last_name("Nader")
    assert_equal 3, results.count
  end
end
