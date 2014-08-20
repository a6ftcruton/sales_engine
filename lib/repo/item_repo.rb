require 'csv'
require_relative '../item'
require_relative '../list_search'

class ItemRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize
    @csv = CSV.open('data/items.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Item.new(row) }
  end

  def find_by_merchant_id(id)
    collection.find do |item|
      item.merchant_id == id
    end
  end
end
