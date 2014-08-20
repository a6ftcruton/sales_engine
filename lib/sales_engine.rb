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
    attr_reader :merchant_repo,
                :invoice_repo,
                :item_repo

  def initialize
      @merchant_repo = MerchantRepo.new(self)
      @invoice_repo  = InvoiceRepo.new
      @item_repo     = ItemRepo.new
  end

  def find_invoices_by_merchant_id(id)
    invoice_repo.find_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    item_repo.find_by_merchant_id(id)
  end
end
