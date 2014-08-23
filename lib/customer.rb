class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(repo, attributes = {})
    @id            = attributes[:id].to_i
    @first_name    = attributes[:first_name].downcase
    @last_name     = attributes[:last_name].downcase
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @customer_repo = repo
  end

  def invoices
    @customer_repo.find_invoices_by_customer_id(id)
  end
end
