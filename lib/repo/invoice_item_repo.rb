require 'csv'
require_relative '../invoice_item'
require_relative '../list_search'

class InvoiceItemRepo
  include ListSearch

  attr_reader :csv,
              :collection

  def initialize(repo, invoice_items_data)
    # @csv               = CSV.open('data/invoice_items.csv', headers: true, header_converters: :symbol)
    @collection        = invoice_items_data.map { |row| InvoiceItem.new(row) }
    @invoice_item_repo = repo
  end
end
