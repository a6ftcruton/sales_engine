require 'csv'
require_relative '../merchant'
require_relative '../list_search'

class MerchantRepo
  include ListSearch

  attr_reader :csv,
              :collection
              :sales_engine

  def initialize(engine)
    @csv          = CSV.open('data/merchants.csv', headers: true, header_converters: :symbol)
    @collection   = csv.map { |row| Merchant.new(row) }
    @sales_engine = engine
  end


  def find_invoices_by_merchant_id(id)
    @sales_engine.find_invoices_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    @sales_engine.find_items_by_merchant_id(id)
  end
end
