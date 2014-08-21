class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

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
end
