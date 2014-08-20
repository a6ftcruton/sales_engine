class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(attributes = {}, repo)
    @id          = attributes[:id]
    @name        = attributes[:name]
    @description = attributes[:description]
    @unit_price  = attributes[:unit_price]
    @merchant_id = attributes[:merchant_id]
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @item_repo   = repo
  end
end
