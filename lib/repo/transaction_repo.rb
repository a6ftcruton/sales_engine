require 'csv'
require_relative '../transaction'
require_relative '../list_search'

class TransactionRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, transaction_data)
    @collection   = transaction_data.map { |row| Transaction.new(self, row) }
    @sales_engine = engine
  end

  def find_transactions_by_invoice_id(id)
    collection.find_all do |transaction|
      transaction.invoice_id == id
    end
  end

  def find_invoice_by_invoice_id(invoice_id)
    sales_engine.find_invoice_by_invoice_id(invoice_id)
  end
end
