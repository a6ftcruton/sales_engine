require 'csv'
require_relative 'customer'
require_relative 'invoice_item'
require_relative 'invoice'
require_relative 'item'
require_relative 'merchant'
require_relative 'transaction'
require_relative './repo/customer_repo'
require_relative './repo/invoice_item_repo'
require_relative './repo/invoice_repo'
require_relative './repo/item_repo'
require_relative './repo/merchant_repo'
require_relative './repo/transaction_repo'

class SalesEngine
  attr_reader :customer_repo,
              :invoice_item_repo,
              :invoice_repo,
              :item_repo,
              :merchant_repo,
              :transaction_repo

  def initialize
    csv = CSV.open('data/customers.csv', headers: true, header_converters: :symbol)
    @customer_repo     = CustomerRepo.new(self, csv)
    csv = CSV.open('data/invoice_items.csv', headers: true, header_converters: :symbol)
    @invoice_item_repo = InvoiceItemRepo.new(self, csv)
    csv = CSV.open('data/invoices.csv', headers: true, header_converters: :symbol)
    @invoice_repo      = InvoiceRepo.new(self, csv)
    csv = CSV.open('data/items.csv', headers: true, header_converters: :symbol)
    @item_repo         = ItemRepo.new(self, csv)
    csv = CSV.open('data/merchants.csv', headers: true, header_converters: :symbol)
    @merchant_repo     = MerchantRepo.new(self, csv)
    csv = CSV.open('data/transactions.csv', headers: true, header_converters: :symbol)
    @transaction_repo  = TransactionRepo.new(self, csv)
  end

  def startup
    # se = SalesEngine.new ???
  end

  def find_invoices_by_merchant_id(id)
    invoice_repo.find_all_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    item_repo.find_all_by_merchant_id(id)
  end

  def find_invoices_by_customer_id(id)
    invoice_repo.find_invoices_by_customer_id(id)
  end

  def find_invoice_items_by_invoice_id(id)
    invoice_item_repo.find_invoice_items_by_invoice_id(id)
  end

  def find_transactions_by_invoice_id(id)
    transaction_repo.find_transactions_by_invoice_id(id)
  end

  def find_item_by_item_id(item_id)
    item_repo.find_item_by_item_id(item_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repo.find_invoice_by_invoice_id(invoice_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    merchant_repo.find_merchant_by_merchant_id(merchant_id)
  end

  def find_customer_by_customer_id(customer_id)
    customer_repo.find_customer_by_customer_id(customer_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repo.find_invoice_by_invoice_id(invoice_id)
  end
end
