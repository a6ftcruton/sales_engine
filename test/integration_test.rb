require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  attr_reader :engine

  def startup
    @engine = SalesEngine.new.startup
  end

  def test_startup_loads_test_files
    refute engine
    engine = SalesEngine.new.startup
    assert engine
  end

  def test_relationship_between_merchant_and_invoice
    engine              = SalesEngine.new.startup
    merchant_repository = engine.merchant_repository
    merchant            = merchant_repository.collection.detect do |merchant|
                            merchant.id == 1
                          end
    invoices            = merchant.invoices

    refute_nil invoices
    assert_equal 59, invoices.count
  end

  def test_relationship_between_merchant_and_items
    engine              = SalesEngine.new.startup
    merchant_repository = engine.merchant_repository
    merchant            = merchant_repository.collection.detect do |merchant|
                            merchant.id == 1
                          end
    items               = merchant.items

    refute_nil   items
    assert_equal 15, items.count
  end

  def test_relationship_between_customers_and_invoices
    engine              = SalesEngine.new.startup
    customer_repository = engine.customer_repository
    customer            = customer_repository.collection.detect do |customer|
                            customer.id == 2
                          end
    invoices            = customer.invoices

    refute_nil      invoices
    assert_equal 1, invoices.count
  end

  def test_relationship_between_invoices_and_invoice_items
    attributes    = [{id: "2"}]
    engine        = SalesEngine.new.startup
    repo          = InvoiceRepo.new(engine, attributes)
    invoice_items = repo.collection.first.invoice_items

    assert_equal 4, invoice_items.count
    invoice_items.each do |invoice_item|
      assert_equal 2, invoice_item.invoice_id
    end
  end

  def test_relationship_between_invoices_and_transactions
    attributes   = [{id: "12"}]
    engine       = SalesEngine.new.startup
    repo         = InvoiceRepo.new(engine, attributes)
    transactions = repo.collection.first.transactions

    assert_equal 3, transactions.count
    transactions.each do |transaction|
      assert_equal 12, transaction.invoice_id
    end
  end

  def test_relationship_between_invoice_item_and_item
    engine                  = SalesEngine.new.startup
    invoice_item_repository = engine.invoice_item_repository
    invoice_item            = invoice_item_repository.collection.detect do |invoice_item|
                                invoice_item.item_id == 1
                              end
    item                    = invoice_item.item

    refute_nil   item
    assert_equal Item, item.class
    assert_equal 1, item.id
  end

  def test_relationship_between_invoice_item_and_invoice
    engine                  = SalesEngine.new.startup
    invoice_item_repository = engine.invoice_item_repository
    invoice_item            = invoice_item_repository.collection.detect do |invoice_item|
                                invoice_item.invoice_id == 1
                              end
    invoice                 = invoice_item.invoice

    refute_nil   invoice
    assert_equal Invoice, invoice.class
    assert_equal 1, invoice.id
  end

  def test_relationship_between_item_and_invoice_items
    engine            = SalesEngine.new.startup
    item_repository   = engine.item_repository
    item              = item_repository.collection.find do |item|
                          item.id == 1
                        end
    invoice_items     = item.invoice_items

    refute_nil   invoice_items
    assert_equal 24, invoice_items.count
  end

  def test_relationship_between_item_and_merchant
    engine             = SalesEngine.new.startup
    item_repository    = engine.item_repository
    item               = item_repository.collection.detect do |item|
                           item.merchant_id == 1
                         end
    merchant           = item.merchant

    refute_nil   merchant
    assert_equal Merchant, merchant.class
    assert_equal 1, merchant.id
  end

  def test_relationship_between_invoice_and_items
    engine             = SalesEngine.new.startup
    invoice_repository = engine.invoice_repository
    target_invoice     = invoice_repository.collection.detect do |invoice|
                           invoice.id == 1
                         end
    items              = target_invoice.items

    refute_nil      items
    assert_equal 8, items.count
  end

  def test_relationship_between_invoice_and_customer
    engine             = SalesEngine.new.startup
    invoice_repository = engine.invoice_repository
    invoice            = invoice_repository.collection.detect do |invoice|
                           invoice.customer_id == 1
                         end
    customer           = invoice.customer

    refute_nil   customer
    assert_equal Customer, customer.class
    assert_equal 1, customer.id
  end

  def test_relationship_between_invoice_and_merchant
    engine             = SalesEngine.new.startup
    invoice_repository = engine.invoice_repository
    invoice            = invoice_repository.collection.find do |invoice|
                           invoice.merchant_id == 31
                         end
    merchant           = invoice.merchant

    refute_nil    merchant
    assert_equal  Merchant, merchant.class
    assert_equal  31, merchant.id
  end

  def test_relationship_between_transaction_and_invoice
    engine                 = SalesEngine.new.startup
    transaction_repository = engine.transaction_repository
    transaction            = transaction_repository.collection.detect do |transaction|
                               transaction.invoice_id == 1
                             end
    invoice                = transaction.invoice

    refute_nil   invoice
    assert_equal Invoice, invoice.class
    assert_equal 1, invoice.id
  end
end
