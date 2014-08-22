require 'csv'
require_relative '../invoice'
require_relative '../list_search'

class InvoiceRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, invoices_data)
    @collection = invoices_data.map { |row| Invoice.new(self, row) }
    @sales_engine = engine
  end

  def find_by_merchant_id(id)
    collection.find do |invoice|
      invoice.merchant_id == id
    end
  end

  def find_all_by_merchant_id(id)
    collection.find_all do |invoice|
      invoice.merchant_id == id
    end
  end

  def find_invoices_by_customer_id(id)
    collection.find_all do |invoice|
      invoice.customer_id == id
    end
  end

  def find_invoice_items_by_invoice_id(id)
    @sales_engine.find_invoice_items_by_invoice_id(id)
  end

  def find_transactions_by_invoice_id(id)
    @sales_engine.find_transactions_by_invoice_id(id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    collection.find do |invoice|
      invoice.id == invoice_id
    end
  end

  def find_customer_by_customer_id(customer_id)
    sales_engine.find_customer_by_customer_id(customer_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    collection.find do |invoice|
      invoice.id == invoice_id
    end
  end

  def find_items_associated_with_invoice_id(id)
    sales_engine.find_items_associated_with_invoice_id(id)
  end
end
