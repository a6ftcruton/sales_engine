class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :item_repo

  def initialize(repo, attributes = {})
    @id          = attributes[:id].to_i
    @name        = attributes[:name].downcase
    @description = attributes[:description]
    @unit_price  = attributes[:unit_price]
    @merchant_id = attributes[:merchant_id].to_i
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @item_repo   = repo
  end

  def invoice_items
    @item_repo.find_invoice_item_by_item_id(id)
  end

  def merchant
    item_repo.find_merchant_by_merchant_id(merchant_id)
    #returns an instance of Merchant associated with this object
  end

  def best_day
    results = @item_repo.find_items_associated_with_invoice_id(self.id)
    results.group_by { |invoice_item| invoice_item.created_at}
  end
end
