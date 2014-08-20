require 'csv'
require_relative '../invoice'
require_relative '../list_search'

class InvoiceRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize(engine)
    @csv = CSV.open('data/invoices.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Invoice.new(row) }
    @sales_engine = engine
  end

  def find_by_merchant_id(id)
    collection.find do |invoice|
      invoice.merchant_id == id
    end
  end
end
