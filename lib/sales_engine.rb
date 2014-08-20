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
  attr_reader :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def initialize
    @customer_repository     = CustomerRepo.new
    @invoice_item_repository = InvoiceItemRepo.new
    @invoice_repository      = InvoiceRepo.new
    @item_repository         = ItemRepo.new
    @merchant_repository     = MerchantRepo.new
    @transaction_repository  = TransactionRepo.new
  end

  def startup
    # se = SalesEngine.new ???
  end
end
