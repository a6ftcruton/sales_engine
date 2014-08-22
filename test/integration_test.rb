require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/invoice_repo'

class IntegrationTest < Minitest::Test
  def test_relationship_between_merchant_and_invoice
    attributes = [{id: "1"}]
    engine = SalesEngine.new
    repo = MerchantRepo.new(engine, attributes)
    invoices = repo.collection.first.invoices
    assert_equal 59, invoices.count
    invoices.each do |invoice|
      assert_equal 1, invoice.merchant_id
    end
  end

  def test_relationship_between_merchant_and_items
    attributes = [{id: "1"}]
    engine = SalesEngine.new
    repo = MerchantRepo.new(engine, attributes)
    items = repo.collection.first.items
    assert_equal 15, items.count
    items.each do |items|
    assert_equal 1, items.merchant_id
    end
  end

  def test_relationship_between_customers_and_invoices
    attributes = [{id: "2"}]
    engine = SalesEngine.new
    repo = CustomerRepo.new(engine, attributes)
    invoices = repo.collection.first.invoices
    assert_equal 1, invoices.count
    invoices.each do |invoice|
      assert_equal 2, invoice.customer_id
    end
  end

  def test_relationship_between_invoices_and_invoice_items
    attributes = [{id: "2"}]
    engine = SalesEngine.new
    repo = InvoiceRepo.new(engine, attributes)
    invoice_items = repo.collection.first.invoice_items
    assert_equal 4, invoice_items.count
    invoice_items.each do |invoice_item|
      assert_equal 2, invoice_item.invoice_id
    end
  end

  def test_relationship_between_invoices_and_transactions
    attributes = [{id: "12"}]
    engine = SalesEngine.new
    repo = InvoiceRepo.new(engine, attributes)
    transactions = repo.collection.first.transactions
    assert_equal 3, transactions.count
    transactions.each do |transaction|
      assert_equal 12, transaction.invoice_id
    end
  end

  def test_relationship_between_invoice_item_and_items
    engine            = SalesEngine.new
    invoice_item_repo = engine.invoice_item_repo
    item              = invoice_item_repo.find_item_by_item_id(1)

    refute_nil   item
    assert_equal Item, item.class
    assert_equal 1, item.id
  end

  def test_relationship_between_invoice_item_and_invoice
    skip 
    engine            = SalesEngine.new
    invoice_item_repo = engine.invoice_item_repo
    invoice           = invoice_item_repo.find_invoice_by_invoice_id

    refute_nil   invoice
    assert_equal Invoice, invoice.class
    assert_equal 1, invoice.id
  end

  def test_relationship_between_item_and_invoice_items
    #me:
    engine            = SalesEngine.new
    item_repo         = engine.item_repo
    item              = item_repo.collection.find do |item|
                          item.id == 1
                        end
    invoice_items     = item.invoice_items

    refute_nil   invoice_items
    assert_equal 24, invoice_items.count
  end

  def test_relationship_between_item_and_merchant
    skip
    engine            = SalesEngine.new
    item_repo         = engine.item_repo
    merchant          = item_repo.find_merchant_by_merchant_id

    refute_nil   merchant
    assert_equal Merchant, merchant.class
    assert_equal 1, merchant.id
  end

  def test_relationship_between_invoice_and_items
    skip
    engine            = SalesEngine.new
    invoice_repo      = engine.invoice_repo
    items             = invoice_repo.find_items_by_going_through_invoice_id_and_then_item_id

    refute_nil     items
    assert_equal 3, items.count
  end

  def test_relationship_between_invoice_and_customer
    skip
    engine            = SalesEngine.new
    invoice_repo      = engine.invoice_repo
    customer          = invoice_repo.find_customer_by_customer_id

    refute_nil    customer
    assert_equal  Customer, customer.class
    assert_equal  1, customer.id
  end

  def test_relationship_between_invoice_and_merchant
    #me:
    engine           = SalesEngine.new
    invoice_repo     = engine.invoice_repo
    invoice          = invoice_repo.collection.find do |invoice|
                         invoice.merchant_id == 31
                       end
    merchant         = invoice.merchant

    refute_nil    merchant
    assert_equal  Merchant, merchant.class
    assert_equal  31, merchant.id
  end

  def test_relationship_between_transaction_and_invoice
    skip
    engine           = SalesEngine.new
    transaction_repo = engine.transaction_repo
    invoice          = transaction_repo.find_by_invoice_id

    refute_nil     invoice
    assert_equal   Invoice, invoice.class
    assert_equal   1, invoice.id
  end
end
