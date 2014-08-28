class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :customer_repository

  def initialize(repo, attributes = {})
    @id                  = attributes[:id].to_i
    @first_name          = attributes[:first_name]
    @last_name           = attributes[:last_name]
    @created_at          = attributes[:created_at]
    @updated_at          = attributes[:updated_at]
    @customer_repository = repo
  end

  def invoices
    customer_repository.find_invoices_by_customer_id(id)
  end
end
