class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :invoice_repository

  def initialize(repo, attributes={})
    @id            = attributes[:id].to_i
    @customer_id   = attributes[:customer_id].to_i
    @merchant_id   = attributes[:merchant_id].to_i
    @status        = attributes[:status]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @invoice_repository  = repo
  end

  def invoice_items
    @invoice_repository.find_invoice_items_by_invoice_id(id)
  end

  def transactions
    @invoice_repository.find_transactions_by_invoice_id(id)
  end

  def items
    # invoice_repository.find_items_associated_with_invoice_id(id)
    item_ids = invoice_items.map do |invoice_item|
                invoice_item.item_id
              end
    items = item_ids.map do |item_id|
       invoice_repository.find_items_associated_with_invoice_id(item_id)
     end
     items
  end

  def customer
    invoice_repository.find_customer_by_customer_id(customer_id)
    # returns an instance of Customer associated with this object
  end

  def merchant
    @invoice_repository.find_all_invoices_by_merchant_id_matching_invoice_merchant_id(merchant_id)
  end
end
