require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def attributes
    {
      id: 1,
      first_name: "Jerde",
      last_name:  "Schroeder",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_stores_id
    customer = Customer.new(attributes)
    assert_equal 1, customer.id
  end

  def test_it_stores_first_name
    customer = Customer.new(attributes)
    assert_equal "Jerde", customer.first_name
  end
end
