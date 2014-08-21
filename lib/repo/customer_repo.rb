require 'csv'
require_relative '../customer'
require_relative '../list_search'

class CustomerRepo
  include ListSearch

  attr_reader :csv,
              :collection,
              :sales_engine

  def initialize(engine)
    @csv = CSV.open('data/customers.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Customer.new(row, self) }
    @sales_engine = engine
  end

  def find_by_last_name(last_name)
    find_by last_name: last_name
  end

  def find_by_first_name(first_name)
    find_by first_name: first_name
  end

  def find_all_by_first_name(name)
    collection.find_all do |customer|
      customer.first_name == name
    end
  end

  def find_all_by_last_name(name)
    collection.find_all do |customer|
      customer.last_name == name
    end
  end

end
