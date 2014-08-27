class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :item_repository

  def initialize(repo, attributes = {})
    @id                = attributes[:id].to_i
    @name              = attributes[:name]
    @description       = attributes[:description]
    # @unit_price        = format_unit_price(attributes[:unit_price])
    @unit_price        = attributes[:unit_price]
    @merchant_id       = attributes[:merchant_id].to_i
    @created_at        = attributes[:created_at]
    @updated_at        = attributes[:updated_at]
    @item_repository   = repo
  end

  def invoice_items
    @item_repository.find_invoice_item_by_item_id(id)
  end

  def merchant
    item_repository.find_merchant_by_merchant_id(merchant_id)
  end

  # private
  # ?? Do you like / need it here or elsewhere ?? 
  #   def format_unit_price(unit_price)
  #     decimal = unit_price.insert(-3, '.')
  #     BigDecimal.new(decimal)
  #   end
end
