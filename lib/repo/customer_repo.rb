require 'csv'
require_relative '../customer'

class CustomerRepo
  attr_reader :csv,
              :customer

  def initialize
    @csv = CSV.open('data/customers.csv', headers: true, header_converters: :symbol)
    @customer = csv.map { |row| Customer.new(row) }
  end
end
