class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :invoice_item_repo

  def initialize(repo, attributes={})
    @id                = attributes[:id].to_i
    @item_id           = attributes[:item_id].to_i
    @invoice_id        = attributes[:invoice_id].to_i
    @quantity          = attributes[:quantity]
    @unit_price        = attributes[:unit_price]
    @created_at        = attributes[:created_at]
    @updated_at        = attributes[:updated_at]
    @invoice_item_repo = repo
  end

  def invoice
    invoice_item_repo.find_invoice_by_invoice_id(invoice_id)
    # returns an instance of Invoice associated with this object
  end

  def item
    invoice_item_repo.find_item_by_item_id(item_id)
  end

end
