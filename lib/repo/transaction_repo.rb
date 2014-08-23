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

  def find_by_id(id)
    find_by id: id
  end

  def find_by_invoice_id(invoice_id)
    find_by invoice_id: invoice_id
  end

  def find_by_credit_card_number(credit_card_number)
    find_by credit_card_number: credit_card_number
  end

  def find_by_credit_card_expiration(credit_card_expiration)
    find_by credit_card_expiration: credit_card_expiration
  end

  def find_by_result(result)
    find_by result: result
  end

  def find_by_created_at(created_at)
    find_by created_at: created_at
  end

  def find_by_updated_at(updated_at)
    find_by updated_at: updated_at
  end

  def find_all_by_id(id)
    find_all_by id: id
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by invoice_id: invoice_id
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by credit_card_number: credit_card_number
  end

  def find_all_by_credit_card_expiration(credit_card_expiration)
    find_all_by credit_card_expiration: credit_card_expiration
  end

  def find_all_by_result(result)
    find_all_by result: result
  end

  def find_all_by_created_at(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by_updated_at(updated_at)
    find_all_by updated_at: updated_at
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
