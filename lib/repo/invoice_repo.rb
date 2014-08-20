require 'csv'
require_relative '../customer'
require_relative '../list_search'

class InvoiceRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize
    @csv = CSV.open('data/invoices.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Invoice.new(row) }
  end
end
