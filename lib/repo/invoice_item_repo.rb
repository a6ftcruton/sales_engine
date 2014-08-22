require 'csv'
require_relative '../invoice_item'
require_relative '../list_search'

class InvoiceItemRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, invoice_items_data)
    @collection   = invoice_items_data.map { |row| InvoiceItem.new(self, row) }
    @sales_engine = engine
  end

  def find_invoice_items_by_invoice_id(id)
    collection.find_all do |invoice_item|
      invoice_item.invoice_id == id
    end
  end

  def find_item_by_item_id(item_id)
    sales_engine.find_item_by_item_id(item_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    sales_engine.find_invoice_by_invoice_id(invoice_id)
  end

  # def find_items_associated_with_invoice_id(id)
  #   collection.find_all do |invoice_item|
  #     invoice_item.invoice_id == id
  #   end
  # end
  def find_invoice_item_by_item_id(id)
    collection.find_all do |invoice_item|
      invoice_item.item_id == id
    end
  end
end
