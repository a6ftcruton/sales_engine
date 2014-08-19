require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/customer_repo'

class CustomerRepoTest < Minitest::Test

  #initializes a new instance of Customer as an array
  #loads in all data from customers.csv
  #store loaded data as array

  def test_it_opens_associated_csv
    customer_repo = CustomerRepo.new
    assert customer_repo.respond_to?(:csv), "No csv method found for CustomerRepo"
  end

  def test_it_creates_customer_instance_by_row
    customer_repo = CustomerRepo.new
    assert customer_repo.customer.kind_of?(Array)
  end

  def test_customer_is_a_collection_of_multiple_objects
    customer_repo = CustomerRepo.new
    assert_equal 1000, customer_repo.customer.count
  end
end
