require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/customer_repo'

class CustomerRepoTest < Minitest::Test

  def test_it_opens_associated_csv
    customer_repo = CustomerRepo.new
    assert customer_repo.respond_to?(:csv), "No csv method found for CustomerRepo"
  end

  def test_it_creates_customer_instance_by_row
    customer_repo = CustomerRepo.new
    assert customer_repo.collection.kind_of?(Array)
  end

  def test_customer_is_a_collection_of_multiple_objects
    customer_repo = CustomerRepo.new
    assert_equal 1000, customer_repo.collection.count
  end

  def test_it_returns_all_rows_using_module_method
    customer_repo = CustomerRepo.new
    collection = customer_repo.collection
    assert_equal 1000, customer_repo.all(collection).count
  end

  def test_it_returns_a_random_row_object
    customer_repo = CustomerRepo.new
    collection = customer_repo.collection
    first_result = customer_repo.random(collection)
    second_result = customer_repo.random(collection)
    refute_equal first_result, second_result
  end

  def test_it_finds_by_last_name
    customer_repo = CustomerRepo.new
    assert_equal 1, customer_repo.find_by_last_name("Ondricka").count
  end

  def test_it_finds_by_first_name
    customer_repo = CustomerRepo.new
    p customer_repo.find_by_first_name("Dejon")
    assert_equal 1, customer_repo.find_by_first_name("Dejon").count
  end
end
