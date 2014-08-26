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
    @id          = attributes[:id].to_i
    @name        = attributes[:name]
    @description = attributes[:description]
    @unit_price  = attributes[:unit_price]
    @merchant_id = attributes[:merchant_id].to_i
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @item_repository   = repo
  end

  def invoice_items
    @item_repository.find_invoice_item_by_item_id(id)
  end

  def merchant
    item_repository.find_merchant_by_merchant_id(merchant_id)
  end

  def best_day
    #findassocieated invoice items
    #collect dates and revenues
    #take all dates that are equal and add the revenue while returning the date
  end
end
