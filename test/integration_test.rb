require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/merchant_repo'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'
require_relative '../lib/repo/invoice_repo'

class IntegrationTest < Minitest::Test
  attr_reader :engine

  def startup
    @engine = SalesEngine.new.startup
  end

  def test_relationship_between_merchant_and_invoice
    engine        = SalesEngine.new.startup
    merchant_repo = engine.merchant_repo
    merchant      = merchant_repo.collection.detect do |merchant|
                      merchant.id == 1
                    end
    invoices      = merchant.invoices
    refute_nil   invoices
    assert_equal 59, invoices.count
  end

  def test_relationship_between_merchant_and_items
    engine        = SalesEngine.new.startup
    merchant_repo = engine.merchant_repo
    merchant      = merchant_repo.collection.detect do |merchant|
                    merchant.id == 1
                  end
    items = merchant.items
    refute_nil   items
    assert_equal  15, items.count
  end

  def test_relationship_between_customers_and_invoices
    engine        = SalesEngine.new.startup
    customer_repo = engine.customer_repo
    customer      = customer_repo.collection.detect do |customer|
                    customer.id == 2
                  end
    invoices = customer.invoices
    refute_nil      invoices
    assert_equal 1, invoices.count
  end

  def test_relationship_between_invoices_and_invoice_items
    attributes = [{id: "2"}]
    engine = SalesEngine.new.startup
    repo = InvoiceRepo.new(engine, attributes)
    invoice_items = repo.collection.first.invoice_items
    assert_equal 4, invoice_items.count
    invoice_items.each do |invoice_item|
      assert_equal 2, invoice_item.invoice_id
    end
  end

  def test_relationship_between_invoices_and_transactions
    attributes = [{id: "12"}]
    engine = SalesEngine.new.startup
    repo = InvoiceRepo.new(engine, attributes)
    transactions = repo.collection.first.transactions
    assert_equal 3, transactions.count
    transactions.each do |transaction|
      assert_equal 12, transaction.invoice_id
    end
  end

  def test_relationship_between_invoice_item_and_item
    engine            = SalesEngine.new.startup
    invoice_item_repo = engine.invoice_item_repo
    invoice_item      = invoice_item_repo.collection.detect do |invoice_item|
                          invoice_item.item_id == 1
                        end
    item              = invoice_item.item
    refute_nil   item
    assert_equal Item, item.class
    assert_equal 1, item.id
  end

  def test_relationship_between_invoice_item_and_invoice
    engine            = SalesEngine.new.startup
    invoice_item_repo = engine.invoice_item_repo
    invoice_item      = invoice_item_repo.collection.detect do |invoice_item|
                        invoice_item.invoice_id == 1
                      end
    invoice =        invoice_item.invoice
    refute_nil   invoice
    assert_equal Invoice, invoice.class
    assert_equal 1, invoice.id
  end

  def test_relationship_between_item_and_invoice_items
    engine            = SalesEngine.new.startup
    item_repo         = engine.item_repo
    item              = item_repo.collection.find do |item|
                          item.id == 1
                        end
    invoice_items     = item.invoice_items
    refute_nil   invoice_items
    assert_equal 24, invoice_items.count
  end

  def test_relationship_between_item_and_merchant
    engine            = SalesEngine.new.startup
    item_repo         = engine.item_repo
    item = item_repo.collection.detect do |item|
      item.merchant_id == 1
    end
    merchant          = item.merchant
    refute_nil   merchant
    assert_equal Merchant, merchant.class
    assert_equal 1, merchant.id
  end

  def test_relationship_between_invoice_and_items
    engine            = SalesEngine.new.startup
    invoice_repo      = engine.invoice_repo
    target_invoice           = invoice_repo.collection.detect do |invoice|
                        invoice.id == 1
                      end
    items           = target_invoice.items
    refute_nil     items
    assert_equal 8, items.count
  end

  def test_relationship_between_invoice_and_customer
    engine            = SalesEngine.new.startup
    invoice_repo      = engine.invoice_repo
    invoice           = invoice_repo.collection.detect do |invoice|
                        invoice.customer_id == 1
                      end
    customer          = invoice.customer
    refute_nil    customer
    assert_equal  Customer, customer.class
    assert_equal  1, customer.id
  end

  def test_relationship_between_invoice_and_merchant
    engine           = SalesEngine.new.startup
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
    engine           = SalesEngine.new.startup
    transaction_repo = engine.transaction_repo
    transaction      = transaction_repo.collection.detect do |transaction|
                        transaction.invoice_id == 1
                      end
    invoice          = transaction.invoice
    refute_nil     invoice
    assert_equal   Invoice, invoice.class
    assert_equal   1, invoice.id
  end
end
