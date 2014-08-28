class InvoiceRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, invoices_data)
    @collection   = invoices_data.map { |row| Invoice.new(self, row) }
    @sales_engine = engine
  end

  def find_by_id(id)
    find_by id: id
  end

  def find_by_customer_id(customer_id)
    find_by customer_id: customer_id
  end

  def find_by_merchant_id(merchant_id)
    find_by merchant_id: merchant_id
  end

  def find_by_status(status)
    find_by status: status
  end

  def find_by_created_at(created_at)
    find_by created_at: created_at
  end

  def find_by_updated_at(updated_at)
    find_by updated_at: updated_at
  end

  def find_all_by_id(id)
    find_all_by id: id
  end

  def find_all_by_customer_id(customer_id)
    find_all_by customer_id: customer_id
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by merchant_id: merchant_id
  end

  def find_all_by_status(status)
    find_all_by status: status
  end

  def find_all_by_created_at(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by_updated_at(updated_at)
    find_all_by updated_at: updated_at
  end

  def find_invoices_by_customer_id(id)
    collection.find_all { |invoice| invoice.customer_id == id }
  end

  def find_invoice_items_by_invoice_id(id)
    @sales_engine.find_invoice_items_by_invoice_id(id)
  end

  def find_transactions_by_invoice_id(id)
    @sales_engine.find_transactions_by_invoice_id(id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    collection.find { |invoice| invoice.id == invoice_id }
  end

  def find_customer_by_customer_id(customer_id)
    sales_engine.find_customer_by_customer_id(customer_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    collection.find { |invoice| invoice.id == invoice_id }
  end

  def find_items_associated_with_invoice_id(id)
    sales_engine.find_items_associated_with_invoice_id(id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    @sales_engine.find_all_invoices_by_merchant_id(merchant_id)
  end
end
