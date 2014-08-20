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

  def test_it_returns_a_random_row_object
    collection = repo.collection
    first_result = repo.random(collection)
    second_result = repo.random(collection)
    refute_equal first_result, second_result
  end

  def test_it_finds_by_last_name
    repo   = SalesEngine.new.customer_repo
    result = repo.find_by_last_name("Schroeder")
    # customer = Customer.new(attributes, repo)
    # customer = Customer.new(first_name: "Joey", last_name: "Ondricka", id: "1", updated_at: "2012-03-27 14:54:09 UTC", created_at: "2012-03-27 14:54:09 UTC", repo)
    assert_equal "Schroeder", result.last_name
  end

  # def test_it_finds_by_first_name
  #   engine = SalesEngine.new
  #   customer = Customer.new(first_name: "Joey", last_name: "Ondricka", id: "1", updated_at: "2012-03-27 14:54:09 UTC", created_at: "2012-03-27 14:54:09 UTC")
  #   repo = CustomerRepo.new(engine)
  #   assert_equal customer, repo.find_by_first_name("Joey")
  # end
  #
  def test_it_finds_all_by_first_name
    skip
    collection = repo.collection
    assert_equal "Joey", customer.find_all_by_last_name("Joey")
  end

  def test_it_finds_all_by_last_name
    skip
    engine = SalesEngine.new
    customer = CustomerRepo.new(engine)
    collection = customer.collection
    assert_equal "Nader", customer.find_all_by_last_name("Nader")
  end
end
