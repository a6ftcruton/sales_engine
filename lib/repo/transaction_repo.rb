require 'csv'
require_relative '../transaction'
require_relative '../list_search'

class TransactionRepo
  include ListSearch

  attr_reader :collection

  def initialize(engine, transaction_data)
    @collection = transaction_data.map { |row| Transaction.new(self, row) }
  end
end
