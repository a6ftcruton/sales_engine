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

  # Add methods and tests!

end
