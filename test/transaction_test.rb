require_relative 'test_helper'

class TransactionTest < Minitest::Test
  def attributes
    {
      id:                     1,
      invoice_id:             "Jerde",
      credit_card_number:     "5555-5555-5555-5555",
      credit_card_expiration: "07/17",
      result:                 1,
      created_at:             "2012-03-27 14:53:59 UTC",
      updated_at:             "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_can_store_attribute_id
    engine = SalesEngine.new
    repo  = TransactionRepo.new(engine)
    trans = Transaction.new(attributes, repo)
    assert_equal 1, trans.id
  end

  def test_it_can_store_a_credit_card_number
    engine = SalesEngine.new
    repo  = TransactionRepo.new(engine)
    trans = Transaction.new(attributes, repo)
    assert_equal "5555-5555-5555-5555", trans.credit_card_number
  end

  def test_it_can_store_a_created_at_date
    engine = SalesEngine.new
    repo  = TransactionRepo.new(engine)
    trans = Transaction.new(attributes)
    assert trans.respond_to?(:created_at)
  end
end
