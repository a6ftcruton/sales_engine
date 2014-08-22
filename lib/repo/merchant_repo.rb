require 'csv'
require_relative '../merchant'
require_relative '../list_search'

class MerchantRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, merchant_data)
    @collection   = merchant_data.map { |row| Merchant.new(self, row) }
    @sales_engine = engine
  end


  def find_invoices_by_merchant_id(id)
    @sales_engine.find_invoices_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    @sales_engine.find_items_by_merchant_id(id)
  end

  def find_all_invoices_by_merchant_id_matching_invoice_merchant_id(merchant_id)
    collection.find do |merchant|
      merchant.id == merchant_id
    end
  end
end
