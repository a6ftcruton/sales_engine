class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at
              :invoice_repo

  def initialize(repo, attributes={})
    @id            = attributes[:id].to_i
    @customer_id   = attributes[:customer_id].to_i
    @merchant_id   = attributes[:merchant_id].to_i
    @status        = attributes[:status]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @invoice_repo  = repo
  end

  def invoice_items
    @invoice_repo.find_invoice_items_by_invoice_id(id)
  end

  def transactions
    @invoice_repo.find_transactions_by_invoice_id(id)
  end

  def items
    # returns a collection of associated Items by way of InvoiceItem objects
  end

  def customer
    # returns an instance of Customer associated with this object
  end

  def merchant
    @invoice_repo.find_all_invoices_by_merchant_id_matching_invoice_merchant_id(merchant_id)
  end
end
