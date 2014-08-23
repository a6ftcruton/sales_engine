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

  def find_by(id)
    find_by id: id
  end

  def find_by(item_id)
    find_by item_id: item_id
  end

  def find_by(invoice_id)
    find_by invoice_id: invoice_id
  end

  def find_by(quantity)
    find_by quantity: quantity
  end

  def find_by(unit_price)
    find_by unit_price: unit_price
  end

  def find_by(created_at)
    find_by created_at: created_at
  end

  def find_by(updated_at)
    find_by updated_at: updated_at
  end

  def find_all_by(id)
    find_all_by id: id
  end

  def find_all_by(item_id)
    find_all_by item_id: item_id
  end

  def find_all_by(invoice_id)
    find_all_by invoice_id: invoice_id
  end

  def find_all_by(quantity)
    find_all_by quantity: quantity
  end

  def find_all_by(unit_price)
    find_all_by unit_price: unit_price
  end

  def find_all_by(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by(updated_at)
    find_all_by updated_at: updated_at
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

  def find_invoice_item_by_item_id(id)
    collection.find_all do |invoice_item|
      invoice_item.item_id == id
    end
  end
end
