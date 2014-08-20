require 'csv'
require_relative '../customer'
require_relative '../list_search'

class MerchantRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize
    @csv = CSV.open('data/merchants.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Merchant.new(row) }
  end
end
