require 'csv'
require_relative '../transaction'
require_relative '../list_search'

class TransactionRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize(engine)
    @csv = CSV.open('data/transactions.csv', headers: true, header_converters: :symbol)
    @collection = csv.map { |row| Transaction.new(row) }
  end
end
