class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repository

  def initialize(repo, attributes={})
    @id            = attributes[:id].to_i
    @name          = attributes[:name]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @merchant_repository = repo
  end

  def invoices
    @merchant_repository.find_invoices_by_merchant_id(id)
  end

  def successful?
    invoices.status == "success"
  end

  def items
    @merchant_repository.find_items_by_merchant_id(id)
  end
end
