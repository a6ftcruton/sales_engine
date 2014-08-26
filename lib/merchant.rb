class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repo

  def initialize(repo, attributes={})
    @id            = attributes[:id].to_i
    @name          = attributes[:name].downcase
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @merchant_repo = repo
  end

  def invoices
    @merchant_repo.find_invoices_by_merchant_id(id)
  end

  def successful?
    invoices.status == "success"
  end

  def items
    @merchant_repo.find_items_by_merchant_id(id)
  end

  # returns the total revenue for that merchant across all transactions
  def revenue
    transactions = invoices.map do |invoice|
          invoice.transactions.select do |transaction|
      require 'pry'
      binding.pry
              transaction.result == "success"
          end
    end
  end


end
