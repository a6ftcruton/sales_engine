require_relative 'test_helper'

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
    engine = SalesEngine.new
    repo = CustomerRepo.new(engine)
    customer = Customer.new(attributes, repo)
    assert_equal 1, customer.id
  end

  def test_it_stores_first_name
    engine = SalesEngine.new
    repo = CustomerRepo.new(engine)
    customer = Customer.new(attributes, repo)
    assert_equal "Jerde", customer.first_name
  end
end
