require_relative 'test_helper'

class CustomerTest < Minitest::Test
  attr_reader :customer

  def attributes
    {
      id: "1",
      first_name: "Jerde",
      last_name:  "Schroeder",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def setup
    @customer = Customer.new(nil, attributes)
  end

  def test_it_stores_id
    assert_equal 1, customer.id
  end

  def test_it_stores_first_name
    assert_equal "Jerde", customer.first_name
  end

  def test_it_stores_last_name
    assert_equal "Schroeder", customer.last_name
  end
end
