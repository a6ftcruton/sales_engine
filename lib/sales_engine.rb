require          'csv'
require          'bigdecimal'
require          'date'
require_relative 'customer'
require_relative 'invoice_item'
require_relative 'invoice'
require_relative 'item'
require_relative 'merchant'
require_relative 'transaction'
require_relative 'list_search'
require_relative './repo/customer_repository'
require_relative './repo/invoice_item_repository'
require_relative './repo/invoice_repository'
require_relative './repo/item_repository'
require_relative './repo/merchant_repository'
require_relative './repo/transaction_repository'

class SalesEngine
  attr_reader :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository,
              :dir

  def initialize(dir = "data")
    @dir = dir
  end

  def startup
    header_defaults = {headers: true, header_converters: :symbol}
    csv = CSV.open("#{dir}/customers.csv", header_defaults)
    @customer_repository     = CustomerRepo.new(self, csv)
    csv = CSV.open("#{dir}/invoice_items.csv", header_defaults)
    @invoice_item_repository = InvoiceItemRepo.new(self, csv)
    csv = CSV.open("#{dir}/invoices.csv", header_defaults)
    @invoice_repository      = InvoiceRepo.new(self, csv)
    csv = CSV.open("#{dir}/items.csv", header_defaults)
    @item_repository         = ItemRepo.new(self, csv)
    csv = CSV.open("#{dir}/merchants.csv", header_defaults)
    @merchant_repository     = MerchantRepo.new(self, csv)
    csv = CSV.open("#{dir}/transactions.csv", header_defaults)
    @transaction_repository  = TransactionRepo.new(self, csv)
    self
   end

  def find_invoices_by_merchant_id(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_by_customer_id(id)
    invoice_repository.find_invoices_by_customer_id(id)
  end

  def find_invoice_items_by_invoice_id(id)
    invoice_item_repository.find_invoice_items_by_invoice_id(id)
  end

  def find_transactions_by_invoice_id(id)
    transaction_repository.find_transactions_by_invoice_id(id)
  end

  def find_item_by_item_id(item_id)
    item_repository.find_item_by_item_id(item_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repository.find_invoice_by_invoice_id(invoice_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    merchant_repository.find_merchant_by_merchant_id(merchant_id)
  end

  def find_customer_by_customer_id(customer_id)
    customer_repository.find_customer_by_customer_id(customer_id)
  end

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repository.find_invoice_by_invoice_id(invoice_id)
  end

  def find_items_associated_with_invoice_id(id)
    item_repository.find_items_associated_with_invoice_id(id)
  end

  def find_invoice_items_by_id(id)
    invoice_item_repository.find_invoice_items_by_item_id(id)
  end

  def find_invoice_item_by_item_id(id)
    invoice_item_repository.find_invoice_item_by_item_id(id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    merchant_repository.find_all_invoices_by_merchant_id(merchant_id)
  end
end
