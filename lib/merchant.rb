class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at
              :merchant_repo

  def initialize(attributes={}, repo)
    @id            = attributes[:id]
    @name          = attributes[:name]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @merchant_repo = repo
  end

  def invoices(id)
    @merchant_repo.find_invoices_by_merchant_id(id)
  end

  def items(id)
    @merchant_repo.find_items_by_merchant_id(id)
  end

end
