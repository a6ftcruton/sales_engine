require 'csv'
require_relative '../merchant'
require_relative '../list_search'

class MerchantRepo
  include ListSearch

  attr_reader :csv,
              :collection
              :salesengine

  def initialize(engine)
    @csv = CSV.open('data/merchants.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Merchant.new(row, self) }
    @salesengine = engine
  end


  def find_invoices_by_merchant_id(id)
    @salesengine.find_invoices_by_merchant_id(id)
  end
end
