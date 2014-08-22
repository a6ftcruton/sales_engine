require 'csv'
require_relative '../item'
require_relative '../list_search'

class ItemRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, item_information)
    @collection = item_information.map { |row| Item.new(self, row) }
    @sales_engine = engine
  end

  def find_by_merchant_id(id)
    collection.find do |item|
      item.merchant_id == id
    end
  end

  def find_all_by_merchant_id(id)
    collection.find_all do |item|
      item.merchant_id == id
    end
  end

  def find_item_by_item_id(item_id)
    collection.find do |item|
      item.id == item_id
    end
  end

  def find_merchant_by_merchant_id(merchant_id)
    sales_engine.find_merchant_by_merchant_id(merchant_id)
  end
  
  def find_invoice_item_by_item_id(id)
    @sales_engine.find_invoice_item_by_item_id(id)
  end
end
