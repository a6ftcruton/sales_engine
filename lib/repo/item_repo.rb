require 'csv'
require_relative '../item'
require_relative '../list_search'

class ItemRepo
  include ListSearch

  attr_reader :csv,
              :collection,
              :sales_engine

  def initialize(engine)
    @csv = CSV.open('data/items.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Item.new(row, self) }
    @sales_engine = engine
  end

  def find_by_merchant_id(id)
    collection.find do |item|
      item.merchant_id == id
    end
  end
end
