class ItemRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, item_information)
    @collection   = item_information.map { |row| Item.new(self, row) }
    @sales_engine = engine
  end

  def find_by_id(id)
    find_by id: id
  end

  def find_by_name(name)
    find_by name: name
  end

  def find_by_description(description)
    find_by description: description
  end

  def find_by_unit_price(unit_price)
    collection.find { |record| format_price(record.unit_price) == unit_price }
  end

  def format_price(unit_price)
    if unit_price.length < 5
      decimal = unit_price.insert(-3, '.')
      BigDecimal.new(decimal).to_f
    else
      decimal = unit_price.insert(-3, '.')
      BigDecimal.new(decimal)
    end
  end

  def find_by_merchant_id(merchant_id)
    find_by merchant_id: merchant_id
  end

  def find_by_created_at(created_at)
    find_by created_at: created_at
  end

  def find_by_updated_at(updated_at)
    find_by updated_at: updated_at
  end

  def find_all_by_id(id)
    find_all_by id: id
  end

  def find_all_by_name(name)
    find_all_by name: name
  end

  def find_all_by_description(description)
    find_all_by description: description
  end

  def find_all_by_unit_price(unit_price)
    find_all_by unit_price: unit_price
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by merchant_id: merchant_id
  end

  def find_all_by_created_at(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by_updated_at(updated_at)
    find_all_by updated_at: updated_at
  end

  def find_item_by_item_id(item_id)
    collection.find { |item| item.id == item_id }
  end

  def find_merchant_by_merchant_id(merchant_id)
    sales_engine.find_merchant_by_merchant_id(merchant_id)
  end

  def find_invoice_item_by_item_id(id)
    @sales_engine.find_invoice_item_by_item_id(id)
  end

  def find_items_associated_with_invoice_id(id)
    collection.find  { |item| item.id == id }
  end
end
