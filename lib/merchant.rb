class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repository

  def initialize(repo, attributes={})
    @id                  = attributes[:id].to_i
    @name                = attributes[:name]
    @created_at          = Date.parse(attributes[:created_at])
    @updated_at          = Date.parse(attributes[:updated_at])
    @merchant_repository = repo
  end

  def invoices
    merchant_repository.find_invoices_by_merchant_id(id)
  end

  def items
    merchant_repository.find_items_by_merchant_id(id)
  end

  def revenue(date = nil)
    # if date
    #   my_invoices = invoices.find_by_created_at(date)
    # else
    #   my_invoices = invoices
    # end
    BigDecimal.new(invoices.map(&:total).reduce(:+)) / 100.0
  end
end
