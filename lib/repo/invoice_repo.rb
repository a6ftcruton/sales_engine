require 'csv'
require_relative '../invoice'
require_relative '../list_search'

class InvoiceRepo
  include ListSearch

  attr_reader :collection

  def initialize(engine, invoices_data)
    @collection = invoices_data.map { |row| Invoice.new(self, row) }
    @sales_engine = engine
  end

  def find_by_merchant_id(id)
    collection.find do |invoice|
      invoice.merchant_id == id
    end
  end

  def find_all_by_merchant_id(id)
    collection.find_all do |invoice|
      invoice.merchant_id == id
    end
  end
end
