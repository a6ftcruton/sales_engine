require 'csv'
require_relative '../customer'
require_relative '../list_search'

class CustomerRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize
    @csv = CSV.open('data/customers.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Customer.new(row) }
  end

  def find_by_last_name(last_name)
    find_by last_name: last_name
  end

  def find_by_first_name(first_name)
    find_by first_name: first_name
  end

end
